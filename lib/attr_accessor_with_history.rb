class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    variableName = "@"+attr_name
    variableHistory = "@"+attr_name+"_history"
    class_eval %Q{
      def #{attr_name+"="} (value)
        #{variableHistory} ||= Array.new
        #{variableHistory}.push #{variableName} 
        #{variableName} = value
      end

    }
  end
end
