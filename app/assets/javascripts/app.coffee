servenoble = angular.module('servenoble',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

servenoble.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ArticlesController'
      )
])

controllers = angular.module('controllers',[])
