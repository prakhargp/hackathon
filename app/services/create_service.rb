class Create_service
    def showservice(params)
        tags_arr = []
        Tag.all.each do |tag| 
            tags_arr.push(tag.tag_name)  
        end
        Challenge.paginate(:page => params, :per_page => 3)
    end

    def createservice(params,user)
        @challenge = Challenge.new(params.permit(:title, :description, :tag, :employee_id))
        @challenge.employee = user    
    end
end