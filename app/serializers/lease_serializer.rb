class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :tenant_id, :apartment_id, :rent
end
