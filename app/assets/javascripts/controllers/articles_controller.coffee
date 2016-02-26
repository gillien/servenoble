servenoble.controller("ArticlesController", [ '$scope', '$routeParams', '$location', '$resource', '$sce', 'toaster',
  ($scope, $routeParams, $location, $resource, $sce, toaster)->
    Article = $resource('/articles/:id', { format: 'json' }, { 'update': { method: 'PUT' }})

    $scope.searchIsCollapsed  = true
    $scope.criteria           = $routeParams
    $scope.current_page       = 0

    $scope.list = ()->  
      $location.path('/').search($scope.criteria)

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
        $scope.read_unread(article)

    $scope.read_unread = (article) ->
      article.is_read = !article.is_read
      $scope.update(article)

    $scope.archive = (article) ->
      if article.status == 'archived'
        article.status = 'pending'
      else
        article.status = 'archived'

      $scope.update(article)

    $scope.translate = (article) ->
      return if article.status != 'pending'

      article.status = 'approved'
      $scope.update(article)

    $scope.update = (article) ->
      Article.update({id: article.id}, article,
        ((response)-> 
          toaster.pop(
            type: 'success'
            title: 'Article updated successfully.'
            showCloseButton: true)),
        ((error) -> 
          toaster.pop(
            type: 'error'
            title: error.message
            showCloseButton: true))
      )

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