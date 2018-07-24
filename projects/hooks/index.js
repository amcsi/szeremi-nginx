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
                                           
const exportsObject = {};                        

for (let serviceName in projects) {
	let imageName = `amcsi/${projects[serviceName]}`;
  exportsObject[`${imageName}:latest`] = `pull-and-stop.sh ${imageName} ${serviceName}`;
}

module.exports = exportsObject;
