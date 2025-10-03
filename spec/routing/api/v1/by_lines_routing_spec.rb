require "rails_helper"

Rspec.describe Api do
 Rspec.describe V1 do
  Rspec.describe ByLinesController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(api_v1_by_lines_path).to route_to(controller: "api/v1/by_lines", action: "index", format: 'json')
      end

      it "routes to #show" do
        expect(api_v1_by_line_path(id: '1'))
          .to route_to(controller: "api/v1/by_lines", action: "show", id: "1", format: 'json')
      end


      it "routes to #create" do
        expect(api_v1_create_by_line_path(name: 'Writer'))
          .to route_to(controller: "api/v1/by_lines", action: "create", name: 'Writer', format: 'json')
      end

      it "routes to #update via PUT" do
        expect(api_v1_update_by_line_path(id: '1'))
          .to route_to(controller: "api/v1/by_lines", action: "update", id: "1", by_line: { name: 'Writer' }, format: 'json')
      end

      it "routes to #update via PATCH" do
        expect(api_v1_update_by_line_path(id: '1'))
          .to route_to(controller: "api/v1/by_lines", action: "update", id: "1", by_line: { name: 'Writer' }, format: 'json')
      end

      it "routes to #destroy" do
        expect(api_v1_delete_by_line_path(id: '1'))
          .to route_to(controller: "api/v1/by_lines", action: "destroy", id: "1", format: 'json')
      end
    end
  end
 end
end
# RSpec.describe Api::V1::ByLinesController, type: :routing do
#   describe "routing" do
#     it "routes to #index" do
#       expect(api_v1_by_lines_path).to route_to(controller: "api/v1/by_lines", action: "index", format: 'json')
#     end

#     it "routes to #show" do
#       expect(api_v1_by_line_path(id: '1'))
#         .to route_to(controller: "api/v1/by_lines", action: "show", id: "1", format: 'json')
#     end


#     it "routes to #create" do
#       expect(api_v1_create_by_line_path(name: 'Writer'))
#         .to route_to(controller: "api/v1/by_lines", action: "create", name: 'Writer', format: 'json')
#     end

#     it "routes to #update via PUT" do
#       expect(api_v1_update_by_line_path(id: '1'))
#         .to route_to(controller: "api/v1/by_lines", action: "update", id: "1", by_line: { name: 'Writer' }, format: 'json')
#     end

#     it "routes to #update via PATCH" do
#       expect(api_v1_update_by_line_path(id: '1'))
#         .to route_to(controller: "api/v1/by_lines", action: "update", id: "1", by_line: { name: 'Writer' }, format: 'json')
#     end

#     it "routes to #destroy" do
#       expect(api_v1_delete_by_line_path(id: '1'))
#         .to route_to(controller: "api/v1/by_lines", action: "destroy", id: "1", format: 'json')
#     end
#   end
# end
