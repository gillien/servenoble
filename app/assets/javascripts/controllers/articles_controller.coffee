controllers = angular.module('controllers', ['ui.bootstrap',  'infinite-scroll'])

controllers.controller("ArticlesController", [ '$scope', '$routeParams', '$location', '$resource', '$sce'
  ($scope, $routeParams, $location, $resource, $sce)->
    Article = $resource('/articles/:id', { format: 'json' }, { 'update': { method: 'PUT' }})

    $scope.searchIsCollapsed  = true
    $scope.criteria           = $routeParams
    $scope.current_page       = 0

    $scope.list = ()->  
      $location.path("/").search($scope.criteria)

    $scope.getHtml = (content)->
      $sce.trustAsHtml(content)

    $scope.loadMore = () ->
      return if $scope.isLoadingMore == true

      $scope.isLoadingMore = true
      unless $scope.articles is undefined 
        page = Math.ceil($scope.articles.length / 10)
        return if page == $scope.criteria.page

      $scope.search(page)

    $scope.read = (article) ->
      article.isCollapsed = !article.isCollapsed

      if (article.is_read == false)
        article.is_read     = true
        Article.update({ id: article.id }, article)

    $scope.read_unread = (article) ->
      article.is_read = !article.is_read
      Article.update({ id: article.id }, article)

    $scope.archive = (article) ->
      if article.status == 'archived'
        article.status = 'pending'
      else
        article.status = 'archived'

      Article.update({ id: article.id }, article)

    $scope.translate = (article) ->
      return if article.status != 'pending'

      article.status = 'approved'
      Article.update({ id: article.id }, article)

    $scope.search = (page = 0) ->
      $scope.criteria.page = page

      Article.query(
        $scope.criteria, 
        (results) ->
          if page == 0
            $scope.articles = results
          else
            for article in results
              $scope.articles.push(article)

          $scope.searchIsCollapsed  = true
          $scope.isLoadingMore      = false
      )
])