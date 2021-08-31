class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    
  end
  
  def bonus(multiplier)
    if self.class == Employee
      @salary * multiplier
    end
  end
end

class Manager < Employee
  def initialize()
    @employees = []
  end

end

if __FILE__ == $PROGRAM_NAME
  emp = Employee.new("Maria", "simple_worker", 15000, "George")
  p emp.class == Employee

  emp1 = Manager.new #"George", "not_so_simple_worker", 25000, "Maria"
  p emp1.class == Manager
end