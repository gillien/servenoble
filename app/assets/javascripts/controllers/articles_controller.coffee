controllers = angular.module('controllers', ['ui.bootstrap'])
controllers.controller("ArticlesController", [ '$scope', '$routeParams', '$location', '$resource', '$sce'
  ($scope, $routeParams, $location, $resource, $sce)->
    $scope.searchIsCollapsed = true
    $scope.criteria = $routeParams

    $scope.search = ()->  
      $location.path("/").search($scope.criteria)

    $scope.getHtml = (content)->
      $sce.trustAsHtml(content)

    $scope.list = ->
      Article = $resource('/articles/:articleId', { articleId: "@id", format: 'json' })
      Article.query(
        $scope.criteria, 
        (results)-> $scope.articles = results
      )

    $scope.list()
])