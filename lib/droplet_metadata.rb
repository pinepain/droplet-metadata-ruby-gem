require 'json'
require 'net/http'

class DropletMetadata
  def self.droplet_id
    metadata['droplet_id']
  end

  def self.hostname
    metadata['hostname']
  end

  def self.vendor_data
    metadata['vendor_data']
  end

  def self.public_keys
    metadata['public_keys'] || []
  end

  def self.auth_key
    metadata['auth_key']
  end

  def self.region
    metadata['region']
  end

  def self.interfaces
    metadata['interfaces']
  end

  def self.floating_ip
    metadata['floating_ip']
  end

  def self.dns
    metadata['dns']
  end

  def self.tags
    metadata['tags'] || []
  end

  def self.metadata
    uri = URI.parse('http://169.254.169.254/metadata/v1.json')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    JSON.parse(response.body)
  end
end
