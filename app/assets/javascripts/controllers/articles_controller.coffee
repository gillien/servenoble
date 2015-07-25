controllers = angular.module('controllers', ['ui.bootstrap'])
controllers.controller("ArticlesController", [ '$scope', '$routeParams', '$location', '$resource', '$sce'
  ($scope, $routeParams, $location, $resource, $sce)->

    Article = $resource('/articles/:articleId', { articleId: "@id", format: 'json' })

    $scope.search = (keywords)->  
      $location.path("/").search('keywords', keywords)

    $scope.getHtml = (content)->
      $sce.trustAsHtml(content)

    $routeParams.keywords ||= ''

    Article.query(q: $routeParams.keywords, (results)-> $scope.articles = results)
])