controllers = angular.module('controllers', ['ui.bootstrap'])
controllers.controller("ArticlesController", [ '$scope', '$routeParams', '$location', '$resource', '$sce'
  ($scope, $routeParams, $location, $resource, $sce)->
    $scope.searchIsCollapsed = true
    $scope.criteria = $routeParams

    $scope.list = ()->  
      $location.path("/").search($scope.criteria)

    $scope.getHtml = (content)->
      $sce.trustAsHtml(content)

    $scope.search = ->
      Article = $resource('/articles/:articleId', { articleId: "@id", format: 'json' })
      Article.query(
        $scope.criteria, 
        (results)-> $scope.articles = results
      )

    $scope.search()
])