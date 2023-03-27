require_relative '00_tree_node'


class KnightPathFinder
    attr_reader :root_node
    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_positions = [starting_pos]
        @root_node = PolyTreeNode.new(@starting_pos)
        build_move_tree
    end
    
    def self.valid_moves(pos)
        bigArr = []
        arr = [[-2,-1],[-2,1],[-1,2],[-1,-2],[2,-1],[2,1],[1,2],[1,-2]]
        arr.each do |subarr|
            new_arr = []
            (0..1).each do |i|
                coordinate = (pos[i]+subarr[i])
                new_arr << coordinate if ((0..7).to_a.include?(coordinate))
            end
            bigArr << new_arr if !bigArr.include?(new_arr) && new_arr.size > 1
        end
        bigArr
    end

    def new_move_positions(pos)
       KnightPathFinder.valid_moves(pos).select {|arr| !@considered_positions.include?(arr)}
    end
    
    def build_move_tree
        # self.root_node.bfs([0,0])
        # queue = new_move_positions(@root_node.value)
        queue = [@root_node]

        visited = []

        while !queue.empty?

            current = queue.shift

                visited << current
                @considered_positions << current
            
            new_move_positions(current.value).each do |pos|
                next_node = PolyTreeNode.new(pos) 
                # kid.parent=(current)                #pos, parent=nil no children
                current.add_child(next_node)  
                queue << next_node
            end 
        end
    end

    def find_path(end_pos)

    end_node = root_node.dfs(end_pos)

    trace_path_back(end_node)

    end 


    def trace_path_back(end_node)

        nodes = []

        current_node = end_node 
        until current_node.nil?

            nodes << current_node

            current_node = current_node.parent

    end 
 
end
