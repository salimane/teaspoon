class Teaspoon.Jasmine1.Fixture extends Teaspoon.fixture

  @load: ->
    args = arguments
    throw "Teaspoon can't load fixtures outside of describe." unless @env().currentSuite || @env().currentSpec
    if @env().currentSuite
      @env().beforeEach => fixture.__super__.constructor.load.apply(@, args)
      @env().afterEach => @cleanup()
      super
    else
      @env().currentSpec.after => @cleanup()
      super


  @set: ->
    args = arguments
    throw "Teaspoon can't load fixtures outside of describe." unless @env().currentSuite || @env().currentSpec
    if @env().currentSuite
      @env().beforeEach => fixture.__super__.constructor.set.apply(@, args)
      @env().afterEach => @cleanup()
      super
    else
      @env().currentSpec.after => @cleanup()
      super


  @env: -> window.jasmine.getEnv()


# TODO: Register fixture framework with core
window.fixture = Teaspoon.Jasmine1.Fixture
