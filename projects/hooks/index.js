// Keys are service names, values are the amcsi/<docker-hub-project> names.
const projects = {                         
  'elm-tic-tac-toe': 'elm-tic-tac-toe',    
  'lycdb': 'lycdb',                        
  'lycdb-forums': 'lycdb-forums',          
  'lycee-bot': 'lycee-bot',
  'lycee-overture': 'lycee-overture',      
  'mudae': 'mudae-web-ui',
  'phpunit-failures': 'phpunit-failures',  
  'skill-builder': 'skill-builder',        
  'szeremi': 'szeremi',                    
  'teamap': 'teamap',                      
  'toptal-project': 'jogging',             
  'youtube-delete-tracker': 'youtube-delete-tracker',
};                                         
                                           
const exportsObject = {};                        

for (let serviceName in projects) {
	let imageName = `amcsi/${projects[serviceName]}`;
  exportsObject[`${imageName}:latest`] = `pull-and-stop.sh ${imageName} ${serviceName}`;
}

module.exports = exportsObject;
