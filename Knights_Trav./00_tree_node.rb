class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
  
        if self.parent != node && self.parent != nil
            if self.parent.children.include?(self)
                self.parent.children.delete(self)
            end
        end
        @parent = node
        if (node != nil) && (!node.children.include?(self))
            node.children.push(self)
        end
      
    end

    def add_child(child_node)
         child_node.parent = self  
      
    end

    def remove_child(child_node)
        child_node.parent = nil

        if !child_node.parent.children.include?(child_node) 

            raise 
        end     
    end 

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
           result = child.dfs(target_value) 
           if result != nil
             return result 
           end 

        end 
        
        return nil

    end 

    def bfs(target_value)

        queue = [self]                    #add root node to the queue 

        visited = [] 

        while !queue.empty?  
                           #loop through the queue until it is empty                   
            current = queue.shift           #remove the first node from the queue 
            # node = current.last 

        if current.value == target_value                   #check if node == target 
            return current 
        else 
            visited << current                 # add node to visited 

         current.children.each do |child|
            if !visited.include?(child)
                # new_current = current + [child]
                queue << child #new_current
            end 
        end 
    end 
end 

return nil 

end 

end 
            
        
          

