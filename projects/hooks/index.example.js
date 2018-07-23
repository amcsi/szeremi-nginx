// Keys are service names, values are the amcsi/<docker-hub-project> names.
const projects = {                         
  'elm-tic-tac-toe': 'elm-tic-tac-toe',    
  'lycdb': 'lycdb',                        
  'lycdb-forums': 'lycdb-forums',          
  'lycee-overture': 'lycee-overture',      
  'phpunit-failures': 'phpunit-failures',  
  'skill-builder': 'skill-builder',        
  'szeremi': 'szeremi',                    
  'teamap': 'teamap',                      
  'toptal-project': 'jogging',             
};                                         
                                           
const exports = {};                        

for (let serviceName in projects) {
	let dockerHubName = projects[serviceName];
  let imageName = 'amcsi/' + dockerHubName;
  exports[`${dockerHubName}:latest`] = `docker pull ${imageName} && docker stop ${serviceName}`;
}

module.exports = exports;
