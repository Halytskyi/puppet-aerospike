# == Define: aerospike::xdr_credentials_file
#
define aerospike::xdr_credentials_file (
  $all_xdr_credentials
) {
  $dc_credentials = $all_xdr_credentials[$name]
  file { "/etc/aerospike/security-credentials_$name.txt":
    ensure  => file,
    content => template('aerospike/security-credentials.conf.erb'),
    mode    => '0600',
    owner   => $aerospike::system_user,
    group   => $aerospike::system_group,
  }

}
