module SchemaOrgHelper

  #
  # A list of mappings from the open street map key to the type
  #
  # TODO Deal with multiples?
  #
  def schema_org_typeof(object)
    amenity_mapping = {
      'restaurant' => 'Restaurant', 
      'fast_food' => 'FastFoodRestaurant',
      'bar' => 'BarOrPub',
      'pub' => 'BarOrPub'
    }

    if amenity_mapping.key?(object.tags['amenity'])
      return amenity_mapping[object.tags['amenity']]
    end

    "Thing"
  end

  #
  # Translate a tag name to the most likely schema.org property
  #
  def schema_org_property(tag)

    case tag
    when 'website'
      return 'url'
    when 'phone'
      return 'telephone'
    end
    ''
  end

end