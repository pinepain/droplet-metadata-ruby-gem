# droplet-metadata-ruby-gem


The DropletMetadata Ruby Gem is unofficial tiny wrapper for [DigitalOcean Droplets Metadata API](https://developers.digitalocean.com/documentation/metadata/).

> Metadata is a service provided to DigitalOcean Droplets that allows a Droplet to access data about itself,
> i.e. its metadata. Examples of available Droplet metadata include user-provided data (`user-data`),
> Droplet ID, data center region, IP addresses, and tags. Aside from allowing an easy way for a user
> to look-up data about a Droplet, metadata can be used to configure a Droplet and its applications.



You can install gem from the rubygems.org repo, by simply running:

```
gem install droplet_metadata
```

### Basic usage

```ruby
require 'droplet_metadata'

print DropletMetadata.hostname      # 
print DropletMetadata.tags          # array of tags. If droplet has not tags empty array will be returned
```

### API:

 - `DropletMetadata.droplet_id` - droplet numeric id.
 - `DropletMetadata.hostname` - droplet name string, this is normally a droplet name you see in DigitalOcean, e.g. `ubuntu-512mb-nyc3-01`.
   Don't be confused by machine hostname, while by default droplet name set as a hostname, it could be changed manually inside droplet.
 - `DropletMetadata.vendor_data` - raw vendor data as string.
 - `DropletMetadata.public_keys` - array of public keys added to droplet's `root` user authorised keys. 
 - `DropletMetadata.auth_key` - ???
 - `DropletMetadata.region` - region where droplet is created.
 - `DropletMetadata.interfaces` - network interface details.
 - `DropletMetadata.floating_ip` - floating ip details.
 - `DropletMetadata.dns` - dns details.        
 - `DropletMetadata.tags` - array of tags.
 - `DropletMetadata.metadata` - raw droplet metadata as an object in a form it was returned by DigitalOcean endpoint.

Please see the Droplet Metadata API documentation (https://developers.digitalocean.com/documentation/metadata/) for more details


### Building and publishing

```
curl -u <username> https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials

gem build droplet_metadata.gemspec
gem push droplet_metadata-x.y.z.gemspec
gem list -r droplet_metadata
```
