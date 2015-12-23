describe "ArticlesController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  httpBackend  = null
  
  setupController =(keywords, results)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      # capture the injected service
      httpBackend = $httpBackend 

      if results
        request = new RegExp("\/articles.*keywords=#{keywords}")
        httpBackend.expectGET(request).respond(results)

      ctrl  = $controller('ArticlesController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("servenoble"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()
  
  describe 'controller initialization', ->
    describe 'when no keywords present', ->
      beforeEach(setupController())

      it 'defaults to no recipes', ->
        expect(scope.articles).toEqualData([])

  describe 'with keywords', ->
    keywords = 'foo'
    articles = [
      {
        id: 2
        title: 'Baked Potatoes'
      },
      {
        id: 4
        title: 'Potatoes Au Gratin'
      }
    ]
    beforeEach ->
      setupController(keywords, articles)
      httpBackend.flush()

    it 'calls the back-end', ->
      expect(scope.articles).toEqualData(articles)

  describe 'search()', ->
    beforeEach ->
      setupController()

    it 'redirects to itself with a keyword param', ->
      keywords = 'foo'
      scope.search(keywords)
      expect(location.path()).toBe('/')
      expect(location.search()).toEqualData({keywords: keywords})
    