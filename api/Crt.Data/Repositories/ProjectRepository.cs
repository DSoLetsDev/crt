﻿using AutoMapper;
using Crt.Data.Database.Entities;
using Crt.Data.Repositories.Base;
using Crt.Model.Dtos;
using Crt.Model.Dtos.Project;
using Crt.Model.Utils;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Crt.Data.Repositories
{
    public interface IProjectRepository
    {
        Task<PagedDto<ProjectSearchDto>> GetProjectsAsync(decimal[] regions,
            string searchText, bool? isInProgress, decimal[] projectManagerIds,
            int pageSize, int pageNumber, string orderBy, string direction);

        Task<ProjectDto> GetProjectAsync(decimal projectId);
    }

    public class ProjectRepository : CrtRepositoryBase<CrtProject>, IProjectRepository
    {
        public ProjectRepository(AppDbContext dbContext, IMapper mapper) 
            : base(dbContext, mapper)
        {
        }

        public async Task<PagedDto<ProjectSearchDto>> GetProjectsAsync(decimal[] regions,
            string searchText, bool? isInProgress, decimal[] projectManagerIds,
            int pageSize, int pageNumber, string orderBy, string direction)
        {
            var query = DbSet.AsNoTracking();

            if (regions.Length > 0)
            {
                query = query.Where(x => regions.Contains(x.RegionId));
            }

            if (searchText.IsNotEmpty())
            {
                query = query
                    .Where(x => x.ProjectName.Contains(searchText) || x.ProjectNumber.Contains(searchText) 
                        || x.Description.Contains(searchText) || x.Scope.Contains(searchText));
            }

            if (isInProgress != null)
            {
                query = (bool)isInProgress
                    ? query.Where(x => x.EndDate == null || x.EndDate > DateTime.Today)
                    : query.Where(x => x.EndDate != null && x.EndDate <= DateTime.Today);
            }

            if (projectManagerIds.Length > 0)
            {
                query = query.Where(x => projectManagerIds.Contains(x.ProjectMgrId ?? 0));
            }

            query = query.Include(x => x.Region);

            return await Page<CrtProject, ProjectSearchDto>(query, pageSize, pageNumber, orderBy, direction);
        }

        public async Task<ProjectDto> GetProjectAsync(decimal projectId)
        {
            var project = await DbSet.AsNoTracking()
                .Include(x => x.ProjectMgr)
                .Include(x => x.NearstTwnLkup)
                .Include(x => x.CapIndxLkup)
                .Include(x => x.CrtNotes)
                .Include(x => x.RcLkup)
                .Include(x => x.Region)
                .FirstOrDefaultAsync(x => x.ProjectId == projectId);

            return Mapper.Map<ProjectDto>(project);
        }
    }
}
