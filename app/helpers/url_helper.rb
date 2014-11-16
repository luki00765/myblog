module UrlHelper
  def with_subdomain(subdomain)
    subdomain ||= ""
    subdomain += '.' unless subdomain.empty?
    [subdomain, request.host, request.port_string].join
  end

  def without_subdomain(host)
    [request.host, request.port_string].join.split('.').drop(1).join('.')
  end

  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      subdomain = options.delete(:subdomain)
      if subdomain != false
        options[:host] = with_subdomain(subdomain)
      else
        options[:host] = without_subdomain(options[:host])
      end
    end
    super
  end
end
