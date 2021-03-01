class UberSearchBCGeographicalNameSearchAddOn {
	
	/**
	 * Function: constructor
	 * @param () none
	 * @returns () nothing
	 * Function that initializes the class
	 */
	constructor() {
		this.name = "UberSearchBCGeographicalNameSearchAddOn";
		this.version = 1.0;
		this.author = "Volker Schunicht";
		this.pcfg = getPluginConfig(this.name);
		this.addPlugin();
	}
	
	/**
	 * Function: search
	 * @param (string) request
	 * @param (function) callback
	 * @param (array) options
	 * @returns (array) results
	 * Function that executes the search
	 */
	search(request, callback, options) {
		// Get the map's projection 
		var outputSRS = app.map.getView().getProjection().getCode().split(":")[1];
		
		// Define the parameters
		var params = {
			name: request.term,
			outputFormat: "json",
			outputSRS: outputSRS,
			sortBy: "relevance",
			itemsPerPage: app.plugins.UberSearchBCGeographicalNameSearchAddOn.pcfg.maxResults
		};
		$.extend(params, options);
		
		// Query the DataBC GeoCoder
		$.ajax({
			url: "https://apps.gov.bc.ca/pub/bcgnws/names/search",
			data: params
		})
		
		// Handle a successful result
		.done(function(data) {
			var list = [];
			if(data.features && data.features.length > 0) {
				list = data.features.map(function(item) {
					return {
						value: item.properties.name,
						category: "BC Geographical Names",
						data: item
					}
				});
			}
			callback(list);
		})
		
		// Handle a failure
		.fail(function(jqxhr, settings, exception) {
			callback([]);
		}); 
	}
	
	/**
	 * Function: addPlugin
	 * @param () none
	 * @returns () nothing
	 * Function that adds the plugin
	 */
	addPlugin() {
		// Extend ubersearch
		app.uberSearch.searchEngines.push(this.search);
		
		// Show the uberseach input if not already
		$("#frmUberSearch").show();
		
		// Log success
		logger("INFO", this.name + ": Plugin successfully loaded");
	}
	
}

// Class initialization
app.plugins.UberSearchBCGeographicalNameSearchAddOn = new UberSearchBCGeographicalNameSearchAddOn();