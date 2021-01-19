import axios from 'axios';

import store from './redux/store';

import { SHOW_ERROR_DIALOG_MODAL } from './redux/actions/types';
import { buildApiErrorObject } from './utils';
import * as Constants from './Constants';

export const instance = axios.create({
  baseURL: '/api',
  headers: { 'Access-Control-Allow-Origin': '*', Pragma: 'no-cache' },
});

instance.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (!error.response || error.response.status !== 422)
      store.dispatch({ type: SHOW_ERROR_DIALOG_MODAL, payload: buildApiErrorObject(error.response) });

    return Promise.reject(error);
  }
);

export const getCurrentUser = () => instance.get(Constants.API_PATHS.USER_CURRENT);
export const getUser = (id) => instance.get(`${Constants.API_PATHS.USER}/${id}`);
export const getUserStatuses = () => instance.get(Constants.API_PATHS.USER_STATUSES);
export const postUser = (userData) => instance.post(Constants.API_PATHS.USER, userData);
export const putUser = (id, userData) => instance.put(`${Constants.API_PATHS.USER}/${id}`, userData);
export const deleteUser = (id, endDate) =>
  instance.delete(`${Constants.API_PATHS.USER}/${id}`, { data: { id, endDate } });
export const searchUsers = (params) => instance.get(Constants.API_PATHS.USER, { params: { ...params } });
export const getUserAdAccount = (username) => instance.get(`${Constants.API_PATHS.USER_AD_ACCOUNT}/${username}`);

export const getRoles = () => instance.get(Constants.API_PATHS.ROLE);
export const getRole = (id) => instance.get(`${Constants.API_PATHS.ROLE}/${id}`);
export const searchRoles = (params) => instance.get(Constants.API_PATHS.ROLE, { params: { ...params } });
export const postRole = (roleData) => instance.post(Constants.API_PATHS.ROLE, roleData);
export const putRole = (id, roleData) => instance.put(`${Constants.API_PATHS.ROLE}/${id}`, roleData);
export const deleteRole = (id, endDate) =>
  instance.delete(`${Constants.API_PATHS.ROLE}/${id}`, { data: { id, endDate } });

export const getPermissions = () => instance.get(Constants.API_PATHS.PERMISSIONS);

export const getRegions = () => instance.get(Constants.API_PATHS.REGIONS);

export const getMaintenanceTypes = () => instance.get(Constants.API_PATHS.MAINTENANCE_TYPES);
export const getUnitOfMeasures = () => instance.get(Constants.API_PATHS.UNIT_OF_MEASURES);
export const getFeatureTypes = () => instance.get(Constants.API_PATHS.FEATURE_TYPES);

export const getApiClient = () => instance.get(`${Constants.API_PATHS.USER}/api-client`);
export const createApiClient = () => instance.post(`${Constants.API_PATHS.USER}/api-client`);
export const resetApiClientSecret = () => instance.post(`${Constants.API_PATHS.USER}/api-client/secret`);

export const getVersion = () => instance.get(Constants.API_PATHS.VERSION);
