require 'zeus/rails'

class CustomPlan < Zeus::Rails
  def prerake_test
    require 'rake'
  end

  def raket
    Rake.application.run
  end

  # def my_custom_command
  #  # see https://github.com/burke/zeus/blob/master/docs/ruby/modifying.md
  # end

end

Zeus.plan = CustomPlan.new
