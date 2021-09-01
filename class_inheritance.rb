class Employee
    attr_reader :employees, :salary
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        
    end
    
    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        queue = @employees
        sal_sum = 0
        until queue.empty?
        # @employees.inject(0) { |sum, emp| sum + emp.salary } * multiplier
            emp = queue.shift
            sal_sum += emp.salary
            queue += emp.employees if emp.is_a? Ma
        end
        sal_sum * multiplier
    end

end

if __FILE__ == $PROGRAM_NAME
    ned = Manager.new("Ned", "Founder", 1000000)
    darren = Manager.new("Darren", "TA Manager", 78000, ned)
    shawna = Employee.new("Shawna", "TA", 12000, darren)
    david = Employee.new("David", "TA", 10000, darren)
    ned.employees.push(darren)
    darren.employees.push(shawna, david)

    p ned.bonus(5)
    p darren.bonus(4)
    p david.bonus(3)
end