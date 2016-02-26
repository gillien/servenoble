@servenoble = angular.module('servenoble',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'ui.bootstrap',  
  'infinite-scroll', 
  'toaster'
])

@servenoble.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ArticlesController'
      )
])

controllers = angular.module('controllers',[])