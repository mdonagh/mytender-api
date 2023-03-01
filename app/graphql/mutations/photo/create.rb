module Mutations
  module Photo
    class Create < Mutations::BaseMutation
      field :file, ApolloUploadServer::Upload, null: true

      def resolve(**attributes)
        shift = ::Shift.create!(attributes)
        context[:current_user].photos.attach(params[:file])
        { user: context[:current_user] }
      end
    end
  end
end