module ActsAsRoleable::Roleatize
  def acts_as_roleable(*args)
    include RoleModel
    options = args.extract_options!

    roles_attribute options[:roles_mask] if options.has_key?(:roles_mask)
    roles options[:roles] if options.has_key?(:roles)
    add_role_scopes
  end

private

  def add_role_scopes
    return unless active_record_table?
    valid_roles.each do |role|
      define_scopes_for_role role
    end

    define_scope_method(:with_any_role) do |*roles|
      where "#{role_mask_column} & :role_mask > 0", role_mask: mask_for(*roles)
    end

    define_scope_method(:with_all_roles) do |*roles|
      where "#{role_mask_column} & :role_mask = :role_mask", role_mask: mask_for(*roles)
    end

    define_scope_method(:with_only_roles) do |*roles|
      where "#{role_mask_column} = :role_mask", role_mask: mask_for(*roles)
    end
  end

  def active_record_table?
    respond_to?(:table_exists?) && table_exists?
  end

  def define_scopes_for_role(role)
    include_scope   = role.to_s.pluralize
    exclude_scope   = "non_#{include_scope}"

    define_scope_method(include_scope) do
      where "#{role_mask_column} & :role_mask > 0", role_mask: mask_for(role)
    end

    define_scope_method(exclude_scope) do
      where "#{role_mask_column} & :role_mask = 0 OR #{role_mask_column} IS NULL", role_mask: mask_for(role)
    end
  end

  def define_scope_method(method, &block)
    (class << self; self end).class_eval do
      define_method(method, block)
    end
  end

  def role_mask_column
    "#{quoted_table_name}.#{connection.quote_column_name roles_attribute_name}"
  end
end
