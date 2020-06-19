module Concerns
  module Findable
    def find_by_name(name)
        self.all.find {|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
        if obj = self.find_by_name(name)
            obj 
        else 
            self.create(name)    
      end
    end
   
  end
  module Creatable
    module InstanceMethods
        def save
            self.class.all << self
        end

    end
    module ClassMethods
        def create(name)
            self.new.tap {|obj| obj.save}
            #.tap takes whatever we are taping and returns any kind of logik 
         end
         def destroy_all
            self.all.clear
        end
    end
  end
end

 