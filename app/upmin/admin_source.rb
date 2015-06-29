class AdminSource < Upmin::Model
  attributes :key, :uri, :description, :updated_at
  actions :synchronize
end