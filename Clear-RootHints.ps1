function Clear-RootHints {
    [CmdletBinding()]
    param ()

    begin {

        Add-DnsServerRootHint -NameServer a.root-servers.net -IPAddress 198.41.0.4
        Add-DnsServerRootHint -NameServer b.root-servers.net -IPAddress 199.9.14.201
        Add-DnsServerRootHint -NameServer c.root-servers.net -IPAddress 192.33.4.12
        Add-DnsServerRootHint -NameServer d.root-servers.net -IPAddress 199.7.91.13
        Add-DnsServerRootHint -NameServer e.root-servers.net -IPAddress 192.203.230.10
        Add-DnsServerRootHint -NameServer f.root-servers.net -IPAddress 192.5.5.241
        Add-DnsServerRootHint -NameServer g.root-servers.net -IPAddress 192.112.36.4
        Add-DnsServerRootHint -NameServer h.root-servers.net -IPAddress 198.97.190.53
        Add-DnsServerRootHint -NameServer i.root-servers.net -IPAddress 192.36.148.17
        Add-DnsServerRootHint -NameServer j.root-servers.net -IPAddress 192.58.128.30
        Add-DnsServerRootHint -NameServer k.root-servers.net -IPAddress 193.0.14.129
        Add-DnsServerRootHint -NameServer l.root-servers.net -IPAddress 199.7.83.42
        Add-DnsServerRootHint -NameServer m.root-servers.net -IPAddress 202.12.27.33
    }
}