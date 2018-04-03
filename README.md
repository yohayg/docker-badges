Badges for Docker hub repositories
=========================

 [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
 
 [![Dependency Status](https://gemnasium.com/badges/github.com/yohayg/docker-badges.svg)](https://gemnasium.com/github.com/yohayg/docker-badges)

Badges! These tiny pictures with label and some numbers, you see them in many GitHub readmes. We all love them, yeah? Travis, Coveralls, Code Climate, Gemnasium, Gem, PyPi, npm… 
However, most of them are not usable for Java/Groovy guys and that’s quite sad, isn’t it?

Well, I put together [shields.io](http://shields.io/), [Heroku](https://heroku.com) and some Ruby code to generate a shiny badge that shows a repository last build status.


Usage
-----

     
    https://docker-badges.herokuapp.com/docker-hub/{repository}/badge.(svg|png)?style={style}

For example:
-----------

    [![Docker Automated build](https://docker-badges.herokuapp.com/docker-hub/yohayg/tomcat-deployment-listener/badge.svg)](https://hub.docker.com/r/yohayg/tomcat-deployment-listener/)


 [![Docker Automated build](https://docker-badges.herokuapp.com/docker-hub/yohayg/tomcat-deployment-listener/badge.svg)](https://hub.docker.com/r/yohayg/tomcat-deployment-listener/)


License
-------
This project is licensed under [MIT license](http://opensource.org/licenses/MIT).