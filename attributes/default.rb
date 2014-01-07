default['atheme-services']['version'] = '7.0.6'
default['atheme-services']['url'] = 'http://atheme.net/downloads/atheme-services-7.0.6.tar.bz2'
default['atheme-services']['checksum'] = '314fd708dc63145e9db10c5a2ed5afebf16b398d617a633c5e80d003039afdeb'

default['atheme-services']['user'] = 'atheme'
default['atheme-services']['group'] = 'atheme'

# Accounts with operator privleges
#
# Each should be a hash with the account name, operclass, and an optional password
# e.g:
# {'name' => "theOp", 'operclass' => "sra", 'password' => "foobar"}
default['atheme-services']['operators'] = []

# The protocol module to load. One of:
# - Asuka 1.2.1 or later: asuka
# - Bahamut 1.8.x: bahamut
# - Charybdis IRCd: charybdis
# - DreamForge 4.6.7 or later: dreamforge
# - Hybrid 7.1.2 and later: hybrid
# - InspIRCd 1.2 - 2.1 (link protocol 1201-1204) inspircd
# - ircd-ratbox 2.0 and later: ratbox
# - IRCNet ircd (ircd 2.11): ircnet
# - ircd-seven: ircd-seven
# - ircu 2.10.11.07 or later: undernet
# - Nefarious IRCu 0.4.0 or later: nefarious
# - ngIRCd 19 or later [experimental]: ngircd
# - ShadowIRCd 5.0 or later: shadowircd
# - SporksIRCd: sporksircd
# - UnrealIRCd 3.1/3.2: unreal
default['atheme-services']['protocol'] = 'charybdis'

# Protocol mixins.
# 
# These should be used if you do not have/want certain features on your
# network that your ircd normally has. If you do not know what this means,
# you do not need any of them.
# 
# Disable halfops
default['atheme-services']['nohalfops'] = false
# Disable holdnick (use enforcer clients)
default['atheme-services']['noholdnick'] = false
# Disable "protect" mode on channels
default['atheme-services']['noprotect'] = false
# Disable "owner" mode on channels
default['atheme-services']['noowner'] = false

# Database backend module.
# 
# Please select a database backend module. Different backends allow for
# different ways in which the services data can be manipulated. YOU MAY
# ONLY HAVE ONE OF THESE BACKENDS LOADED.
# 
# The following backends are available:
# 
# Atheme 0.1 flatfile database format: flatfile
# Open Services Exchange database format: opensex
# 
# Most networks will want opensex.
# 
default['atheme-services']['backend'] = 'opensex'

# Crypto module.
# 
# If you would like encryption for your services passwords, please
# select a module here. Note that upon starting with a crypto module
# YOUR PASSWORDS ARE IMMEDIATELY AND IRREVERSIBLY CONVERTED. Make at
# least TWO backups of your database before experimenting with this.
# If you have several thousand accounts, this conversion may take
# appreciable time.
# 
# The following crypto modules are available:
# 
# POSIX-style crypt(3): posix
# IRCServices (also Anope etc) compatibility: ircservices
# Raw MD5 (Anope compatibility): rawmd5
# Raw SHA1 (Anope compatibility): rawsha1
# 
# The ircservices, rawmd5 and rawsha1 modules are only recommended for use with
# a database converted from other services with password encryption.
# 
# The rawsha1 module requires OpenSSL.
# 
default['atheme-services']['crypto'] = 'posix'

# Authentication module.
# 
# These allow using passwords from an external system. The password given
# when registering a new account is also checked against the external
# system.
# 
# The following authentication modules are available:
# 
# LDAP: ldap
# 
# The LDAP module requires OpenLDAP client libraries. It uses them in a
# synchronous manner, which means that an unresponsive LDAP server can
# freeze services.
# 
default['atheme-services']['auth-modules'] = []

# NickServ modules.
# 
# Here you can disable or enable certain features of NickServ, by
# defining which modules are loaded. You can even disable NickServ
# entirely. Please note however, that an authentication service
# (either NickServ, or UserServ) are required for proper functionality.
# 
# The CrackLib password validation module requires CrackLib to be
# installed on your system in order to use.
# 
# Core components: main
# Nickname access lists: access
# Bad email address blocking: badmail
# CertFP fingerprint managment: cert
# CrackLib password validation: cracklib
# DROP command: drop
# Nickname enforcement: enforce
# GHOST command: ghost
# GROUP and UNGROUP commands: group
# HELP command: help
# Nickname expiry override (HOLD command): hold
# IDENTIFY command: identify
# INFO command: info
# LIST command: list
# LISTMAIL command: listmail
# LISTOWNMAIL command: listownmail
# LOGIN command (for no_nick_ownership): login
# LOGOUT command: logout
# MARK command: mark
# FREEZE command: freeze
# LISTCHANS command: listchans
# LISTGROUPS command: listgroups
# REGISTER command: register
# Bypass registration limits (REGNOLIMIT): regnolimit
# Password reset (RESETPASS command): resetpass
# RESTRICT command: restrict
# Password return (RETURN command): return
# Password retrieval (SENDPASS command): sendpass
# Password retrieval allowed to normal users: sendpass_user
# SET command core: set_core
# Change primary nickname (SET ACCOUNTNAME): set_accountname
# SET EMAIL command: set_email
# SET EMAILMEMOS command: set_emailmemos
# SET ENFORCETIME command: set_enforcetime
# SET HIDEMAIL command: set_hidemail
# SET LANGUAGE command: set_language
# SET NEVERGROUP command: set_nevergroup
# SET NEVEROP command: set_neverop
# SET NOGREET command: set_nogreet
# SET NOMEMO command: set_nomemo
# SET NOOP command: set_noop
# SET PASSWORD command: set_password
# PRIVMSG instead of NOTICE (SET PRIVMSG cmd): set_privmsg
# Account info hiding (SET PRIVATE command): set_private
# SET PROPERTY command: set_property
# SET QUIETCHG command: set_quietchg
# Password retrieval uses code (SETPASS cmd): setpass
# STATUS command: status
# Nickname metadata viewer (TAXONOMY command): taxonomy
# VACATION command: vacation
# VERIFY command: verify
# VHOST command: vhost
# 
default['atheme-services']['nickserv-modules'] = %w(
  main badmail drop ghost group help hold identify info list listmail logout
  mark freeze listchans listgroups register regnolimit resetpass restrict return
  setpass sendpass_user set_core set_accountname set_email set_emailmemos
  set_hidemail set_language set_nevergroup set_neverop set_nogreet set_nomemo
  set_noop set_password set_property set_quietchg status taxonomy vacation
  verify vhost)

# ChanServ modules.
# 
# Here you can disable or enable certain features of ChanServ, by
# defining which modules are loaded. You can even disable ChanServ
# entirely. Please note that ChanServ requires an authentication
# service, either NickServ or UserServ will do.
# 
# Core components: main
# ACCESS command (simplified ACL editing): access
# AKICK command: akick
# BAN/UNBAN commands: ban
# UNBAN self only (load ban or this not both): unban_self
# CLOSE command: close
# CLONE command: clone
# CLEAR command: clear
# CLEAR BANS command: clear_bans
# CLEAR FLAGS command: clear_flags
# CLEAR USERS command: clear_users
# COUNT command: count
# DROP command: drop
# Forced flags changes: fflags
# FLAGS command: flags
# Forced foundership transfers: ftransfer
# GETKEY command: getkey
# HALFOP/DEHALFOP commands: halfop
# HELP command: help
# Channel expiry override (HOLD command): hold
# INFO command: info
# INVITE command: invite
# KICK/KICKBAN commands: kick
# LIST command: list
# MARK command: mark
# Moderated channel registrations: moderate
# OP/DEOP commands: op
# OWNER/DEOWNER commands: owner
# PROTECT/DEPROTECT commands: protect
# QUIET command (+q support): quiet
# Channel takeover recovery (RECOVER command): recover
# REGISTER command: register
# SET command core: set_core
# SET EMAIL command: set_email
# SET ENTRYMSG command: set_entrymsg
# SET FANTASY command: set_fantasy
# SET FOUNDER command: set_founder
# SET GAMESERV command: set_gameserv
# SET GUARD command: set_guard
# SET KEEPTOPIC command: set_keeptopic
# SET LIMITFLAGS command: set_limitflags
# SET MLOCK command: set_mlock
# SET PREFIX command: set_prefix
# Channel info hiding (SET PRIVATE command): set_private
# SET PROPERTY command: set_property
# SET RESTRICTED command: set_restricted
# SET SECURE command: set_secure
# SET TOPICLOCK command: set_topiclock
# SET URL command: set_url
# SET VERBOSE command: set_verbose
# STATUS command: status
# SYNC command (and automatic ACL syncing): sync
# Named Successor ACL flag: successor_acl
# Channel metadata viewer (TAXONOMY command): taxonomy
# TEMPLATE command: template
# TOPIC/TOPICAPPEND commands: topic
# VOICE/DEVOICE commands: voice
# WHY command: why
# VOP/HOP/AOP/SOP commands: xop
#  This module provides emulation of the ircservices XOP scheme ONLY.
#  Do not report discrepencies when using native commands to edit channel
#  ACLs. This is intentional.
# 
default['atheme-services']['chanserv-modules'] = %w(
  main access akick ban clone close clear clear_bans clear_flags clear_users
  count drop flags ftransfer getkey help hold info invite kick list mark op
  recover register set_core set_email set_entrymsg set_fantasy set_founder
  set_guard set_keeptopic set_mlock set_prefix set_property set_restricted
  set_secure set_topiclock set_url set_verbose status sync taxonomy template
  topic voice why)

# CHANFIX module.
# 
# Here you can disable or enable certain features of CHANFIX, by
# defining which modules are loaded.
# 
# Core components: main
# 
default['atheme-services']['chanfix-modules'] = []

# OperServ modules.
# 
# Here you can disable or enable certain features of OperServ, by
# defining which modules are loaded.
# 
# Core components: main
# AKILL system: akill
# CLEARCHAN command: clearchan
# CLONES system: clones
# COMPARE command: compare
# GREPLOG command: greplog
# HELP command: help
# IGNORE system: ignore
# IDENTIFY command: identify
# INFO command: info
# INJECT command: inject
# JUPE command: jupe
# MODE command: mode
# MODINSPECT command: modinspect
# MODLIST command: modlist
# MODLOAD command: modload
# MODRELOAD command: modreload
# MODUNLOAD command: modunload
# NOOP system: noop
# Override access (OVERRIDE command): override
# Regex mass akill (RAKILL command): rakill
# RAW command: raw
# READONLY command: readonly
# REHASH command: rehash
# RESTART command: restart
# Display regex matching (RMATCH command): rmatch
# Most common realnames (RNC command): rnc
# RWATCH system: rwatch
# Temporarily modify config options (SET command)  set
# SGLINE system: sgline
# SHUTDOWN command: shutdown
# Non-config oper privileges (SOPER command): soper
# Oper privilege display (SPECS command): specs
# SQLINE system: sqline
# UPDATE command: update
# UPTIME command: uptime
# 
default['atheme-services']['operserv-modules'] = %w(
  main akill compare help identify ignore info jupe mode modinspect modlist
  modload modunload modreload noop readonly rehash restart rmatch rnc rwatch
  set sgline shutdown specs sqline update uptime)

# MemoServ modules.
# 
# Here you can disable or enable certain features of MemoServ, by
# defining which modules are loaded. You can even disable MemoServ
# entirely.
# 
# Core components: main
# HELP command: help
# SEND command: send
# Channel memos (SENDOPS command): sendops
# Group memos (SENDGROUP command): sendgroup
# LIST command: list
# READ command: read
# FORWARD command: forward
# DELETE command: delete
# IGNORE command: ignore
# 
default['atheme-services']['memoserv-modules'] = %w(
  main help send sendops sendgroup list read forward delete ignore)

# Global module.
# 
# Like the other services, the Global noticer is a module. You can
# disable or enable it to your liking below. Please note that the
# Global noticer is dependent on OperServ for full functionality.
# 
default['atheme-services']['global-noticer'] = true

# InfoServ module.
# 
# Like the other services, InfoServ is a module. You can disable or
# enable it to your liking below.
# 
default['atheme-services']['infoserv_module'] = true

# SASL agent module.
# 
# Allows clients to authenticate to services via SASL with an appropriate
# ircd. You need the core components and at least one mechanism.
# 
# Core components: main
# PLAIN mechanism: plain
# DH-BLOWFISH mechanism: dh-blowfish
# AUTHCOOKIE mechanism (for IRIS): authcookie
# EXTERNAL mechanism (IRCv3.1+): external
# 
default['atheme-services']['saslserv-modules'] = %w(main plain authcookie)

# GameServ modules.
# 
# Here you can disable or enable certain features of GameServ, by
# defining which modules are loaded. You can even disable GameServ
# entirely.
# 
# Core components: main
# DICE/WOD commands: dice
# EIGHTBALL command: eightball
# Game-specific dice calculators: gamecalc
# HELP commands: help
# LOTTERY command: lottery
# NAMEGEN command: namegen
# RPS command: rps
# 
default['atheme-services']['gameserv-modules'] = []

# RPGServ modules.
# 
# Here you can disable or enable certain features of RPGServ, by
# defining which modules are loaded. You can even disable RPGServ
# entirely.
# 
# Core components: main
# ENABLE/DISABLE commands: enable
# HELP command: help
# INFO command: info
# LIST command: list
# SEARCH command: search
# SET commands: set
# 
default['atheme-services']['rpgserv-modules'] = []

# BotServ modules.
# 
# Here you can disable or enable certain features of BotServ, by
# defining which modules are loaded. You can even disable BotServ
# entirely.
# 
# Core components: main
# HELP command: help
# INFO command: info
# NPC commands (SAY, ACT): bottalk
# SET command (required for SET commands): set_core
# SET FANTASY command: set_fantasy
# SET NOBOT command: set_nobot
# SET PRIVATE command: set_private
# 
default['atheme-services']['botserv-modules'] = []

# HostServ modules.
# 
# Here you can disable or enable certain features of HostServ, by
# defining which modules are loaded. You can even disable HostServ
# entirely.
# 
# HostServ is a more complex, and optional virtual host management service.
# Users wishing only to set vhosts need not use it (they can use the builtin
# vhost management of NickServ instead).
# 
# Core components: main
# HELP command: help
# OFFER system: offer
# ON and OFF commands: onoff
# REQUEST system: request
# VHOST and LISTVHOST commands: vhost
# VHOSTNICK command: vhostnick
# GROUP command: group
# 
default['atheme-services']['hostserv-modules'] = []

# HelpServ modules.
# HelpServ allows users to request help from network staff in a few different ways.
# 
# Core components: main
# HELPME command: helpme
# Help Ticket system: ticket
# Service List: services
# 
# The ticket system works like a bugtracker ot helpdesk ticket system, HELPME
# works like a one-time alert. You should probably only load one of the two systems.
# 
default['atheme-services']['helpserv-modules'] = []

# Channel listing service.
# 
# Allows users to list channels with more flexibility than the /list
# command.
# 
default['atheme-services']['channel-listing-service'] = false

#: StatServ module.
#: StatServ provides basic statistics and split tracking.
#: 
#: Core components: main
#: CHANNEL command: channel
#: NETSPLIT command: netsplit
#: SERVER command: server
#: 
default['atheme-services']['statserv-modules'] = %w(main netsplit server)

# GroupServ module.
# GroupServ allows users to create groups to easily mass-manage channel
# access and more.
# 
# Core components: main
# ACSNOLIMIT command: acsnolimit
# DROP command: drop
# FDROP command: fdrop
# FFLAGS command: fflags
# FLAGS command: flags
# HELP command: help
# INFO command: info
# JOIN command: join
# LIST command: list
# LISTCHANS command: listchans
# REGISTER command: register
# REGNOLIMIT command: regnolimit
# SET command: set
# SET CHANNEL command: set_channel
# SET DESCRIPTION command: set_description
# SET EMAIL command: set_email
# SET JOINFLAGS command: set_joinflags
# SET OPEN command: set_open
# SET PUBLIC command: set_public
# SET URL command: set_url
# 
default['atheme-services']['groupserv-modules'] = %w(
  main acsnolimit drop fdrop fflags flags help info join list listchans register
  regnolimit set set_channel set_description set_email set_joinflags set_open
  set_public set_url)

# 
# Various modules.
# 
# Atheme includes an optional HTTP server that can be used for integration
# with portal software and other useful things. To enable it, load this
# module, and uncomment the httpd { } block towards the bottom of the config.
# 
# HTTP Server: modules/misc/httpd
# 
default['atheme-services']['httpd_module'] = true

# XMLRPC server module.
# 
# The XML-RPC handler requires modules/misc/httpd to be loaded as it merely
# registers a path handler for XML-RPC. The path used for XML-RPC is /xmlrpc.
# 
# XMLRPC handler for the httpd			modules/transport/xmlrpc
# 
default['atheme-services']['xmlrpc'] = true

# Extended target entity types. [EXPERIMENTAL]
# 
# Atheme can set up special target mapping entities which match multiple
# users in channel access entries.  These target mapping entity types are
# defined through the 'exttarget' modules listed below.
# 
# Exttarget handling core: main
# $oper exttarget match type: oper
# $registered exttarget match type: registered
# $channel exttarget match type: channel
# $chanacs exttarget match type: chanacs
# 
default['atheme-services']['exttarget-modules'] = []

# Other modules.
# 
# Put any other modules you want to load on startup here. The path
# is relative to PREFIX or PREFIX/lib/atheme, depending on how Atheme
# was compiled.
# 
# Unlike other node attributes, these are the full paths to the modules
# you wish to install. e.g. modules/contrib/ns_listlogins
# 
default['atheme-services']['other-modules'] = []

# serverinfo block
default['atheme-services']['serverinfo']['name'] = "services.int"
default['atheme-services']['serverinfo']['desc'] = "Atheme IRC Services"
default['atheme-services']['serverinfo']['numeric'] = "00A"
default['atheme-services']['serverinfo']['recontime'] = 10
default['atheme-services']['serverinfo']['netname'] = "misconfigured network"
default['atheme-services']['serverinfo']['hidehostsuffix'] = "users.misconfigured"
default['atheme-services']['serverinfo']['adminname'] = "misconfigured admin"
default['atheme-services']['serverinfo']['adminemail'] = "misconfigured@admin.tld"
default['atheme-services']['serverinfo']['mta'] = "/usr/bin/sendmail"
default['atheme-services']['serverinfo']['loglevel'] = "{ error; info; admin; network; wallops; }"
default['atheme-services']['serverinfo']['maxlogins'] = 5
default['atheme-services']['serverinfo']['maxusers'] = 5
default['atheme-services']['serverinfo']['maxnicks'] = 5
default['atheme-services']['serverinfo']['maxchans'] = 5
default['atheme-services']['serverinfo']['mdlimit'] = 30
default['atheme-services']['serverinfo']['emaillimit'] = 10
default['atheme-services']['serverinfo']['emailtime'] = 300
default['atheme-services']['serverinfo']['auth'] = "none"
default['atheme-services']['serverinfo']['casemapping'] = "rfc1459"

# uplink
default['atheme-services']['uplink']['name'] = "irc.example.com"
default['atheme-services']['uplink']['host'] = "127.0.0.1"
default['atheme-services']['uplink']['vhost'] = nil
default['atheme-services']['uplink']['password'] = "linkage"
default['atheme-services']['uplink']['port'] = "6667"

# NickServ
default['atheme-services']['nickserv']['spam'] = true
default['atheme-services']['nickserv']['no_nick_ownership'] = false
default['atheme-services']['nickserv']['nick'] = "NickServ"
default['atheme-services']['nickserv']['user'] = "NickServ"
default['atheme-services']['nickserv']['host'] = "services.int"
default['atheme-services']['nickserv']['real'] = "Nickname Services"
default['atheme-services']['nickserv']['aliases'] = {
  'ID' => 'IDENTIFY',
  'MYACCESS' => 'LISTCHANS'
}
default['atheme-services']['nickserv']['access'] = ""
default['atheme-services']['nickserv']['expire'] = 30
default['atheme-services']['nickserv']['enforce_expire'] = nil
default['atheme-services']['nickserv']['enforce_delay'] = nil
default['atheme-services']['nickserv']['enforce_prefix'] = nil
default['atheme-services']['nickserv']['cracklib_dict'] = nil
default['atheme-services']['nickserv']['cracklib_warn'] = false
default['atheme-services']['nickserv']['emailexempts'] = []

# ChanServ
default['atheme-services']['chanserv']['nick'] = "ChanServ"
default['atheme-services']['chanserv']['user'] = "ChanServ"
default['atheme-services']['chanserv']['host'] = "services.int"
default['atheme-services']['chanserv']['real'] = "Channel Services"
default['atheme-services']['chanserv']['aliases'] = {}
default['atheme-services']['chanserv']['access'] = ""
default['atheme-services']['chanserv']['fantasy'] = true
default['atheme-services']['chanserv']['hide_xop'] = false

# Templates
default['atheme-services']['templates'] = {
  'vop' => '+AV',
  'hop' => '+AHhtv',
  'aop' => '+AOhiortv',
  'sop' => '+AOafhiorstv',
  'founder' => '+AFORafhiorstv'
}
default['atheme-services']['deftemplates'] = nil

default['atheme-services']['changets'] = false
default['atheme-services']['trigger'] = "!"
default['atheme-services']['expire'] = 30
default['atheme-services']['maxchanacs'] = 0
default['atheme-services']['maxfounders'] = 4
default['atheme-services']['founder_flags'] = nil
default['atheme-services']['akick_time'] = 0

# ChanServ
default['atheme-services']['chanfix']['nick'] = "ChanFix"
default['atheme-services']['chanfix']['user'] = "ChanFix"
default['atheme-services']['chanfix']['host'] = "services.int"
default['atheme-services']['chanfix']['real'] = "Channel Fixing Services"
default['atheme-services']['chanfix']['autofix'] = true

# Global
default['atheme-services']['global']['nick'] = "Global"
default['atheme-services']['global']['user'] = "Global"
default['atheme-services']['global']['host'] = "services.int"
default['atheme-services']['global']['real'] = "Network Announcements"

# InfoServ
default['atheme-services']['infoserv']['nick'] = "InfoServ"
default['atheme-services']['infoserv']['user'] = "InfoServ"
default['atheme-services']['infoserv']['host'] = "services.int"
default['atheme-services']['infoserv']['real'] = "Information Services"
default['atheme-services']['infoserv']['logoninfo_count'] = 3

# OperServ
default['atheme-services']['operserv']['nick'] = "OperServ"
default['atheme-services']['operserv']['user'] = "OperServ"
default['atheme-services']['operserv']['host'] = "services.int"
default['atheme-services']['operserv']['real'] = "Operator Services"
default['atheme-services']['operserv']['aliases'] = {}
default['atheme-services']['operserv']['access'] = ""

# SaslServ
default['atheme-services']['saslserv']['nick'] = "SaslServ"
default['atheme-services']['saslserv']['user'] = "SaslServ"
default['atheme-services']['saslserv']['host'] = "services.int"
default['atheme-services']['saslserv']['real'] = "SASL Authentication Agent"

# MemoServ
default['atheme-services']['memoserv']['nick'] = "MemoServ"
default['atheme-services']['memoserv']['user'] = "MemoServ"
default['atheme-services']['memoserv']['host'] = "services.int"
default['atheme-services']['memoserv']['real'] = "Memo Services"
default['atheme-services']['memoserv']['aliases'] = {}
default['atheme-services']['memoserv']['access'] = ""

# GameServ
default['atheme-services']['gameserv']['nick'] = "GameServ"
default['atheme-services']['gameserv']['user'] = "GameServ"
default['atheme-services']['gameserv']['host'] = "services.int"
default['atheme-services']['gameserv']['real'] = "Game Services"
default['atheme-services']['gameserv']['aliases'] = {}
default['atheme-services']['gameserv']['access'] = ""

# RPGServ
default['atheme-services']['rpgserv']['nick'] = "RPGServ"
default['atheme-services']['rpgserv']['user'] = "RPGServ"
default['atheme-services']['rpgserv']['host'] = "services.int"
default['atheme-services']['rpgserv']['real'] = "RPG Finding Services"
default['atheme-services']['rpgserv']['aliases'] = {}
default['atheme-services']['rpgserv']['access'] = ""

# BotServ
default['atheme-services']['botserv']['nick'] = "BotServ"
default['atheme-services']['botserv']['user'] = "BotServ"
default['atheme-services']['botserv']['host'] = "services.int"
default['atheme-services']['botserv']['real'] = "Bot Services"
default['atheme-services']['botserv']['aliases'] = {}
default['atheme-services']['botserv']['access'] = ""
default['atheme-services']['botserv']['min_users'] = 0

# GroupServ
default['atheme-services']['groupserv']['nick'] = "GroupServ"
default['atheme-services']['groupserv']['user'] = "GroupServ"
default['atheme-services']['groupserv']['host'] = "services.int"
default['atheme-services']['groupserv']['real'] = "Group Management Services"
default['atheme-services']['groupserv']['aliases'] = {}
default['atheme-services']['groupserv']['access'] = ""
default['atheme-services']['groupserv']['maxgroups'] = 5
default['atheme-services']['groupserv']['maxgroupacs'] = 100
default['atheme-services']['groupserv']['enable_open_groups'] = true
default['atheme-services']['groupserv']['join_flags'] = "+"

# HostServ
default['atheme-services']['hostserv']['nick'] = "HostServ"
default['atheme-services']['hostserv']['user'] = "HostServ"
default['atheme-services']['hostserv']['host'] = "services.int"
default['atheme-services']['hostserv']['real'] = "Host Management Services"
default['atheme-services']['hostserv']['request_per_nick'] = false
default['atheme-services']['hostserv']['aliases'] = {
  'APPROVE' => 'ACTIVATE',
  'DENY' => 'REJECT'
}
default['atheme-services']['hostserv']['access'] = ""

# HelpServ
default['atheme-services']['helpserv']['nick'] = "HelpServ"
default['atheme-services']['helpserv']['user'] = "HelpServ"
default['atheme-services']['helpserv']['host'] = "services.int"
default['atheme-services']['helpserv']['real'] = "Help Services"

# StatServ
default['atheme-services']['statserv']['nick'] = "StatServ"
default['atheme-services']['statserv']['user'] = "StatServ"
default['atheme-services']['statserv']['host'] = "services.int"
default['atheme-services']['statserv']['real'] = "Statistics Services"

# ALIS
default['atheme-services']['alis']['nick'] = "ALIS"
default['atheme-services']['alis']['user'] = "alis"
default['atheme-services']['alis']['host'] = "services.int"
default['atheme-services']['alis']['real'] = "Channel Directory"

# HTTPD
default['atheme-services']['httpd']['host'] = "0.0.0.0"
default['atheme-services']['httpd']['ipv6_host'] = nil
default['atheme-services']['httpd']['www_root'] = "/var/www"
default['atheme-services']['httpd']['port'] = "8080"

# LDAP
default['atheme-services']['ldap']['url'] = "ldap://127.0.0.1"
default['atheme-services']['ldap']['dnformat'] = "cn=%s,dc=jillestest,dc=com"

# Logging
default['atheme-services']['logfiles'] = [
  'logfile "var/account.log" { register; set; };',
  'logfile "var/commands.log" { commands; };',
  'logfile "#services" { error; info; admin; request; register; };'
]

# General
default['atheme-services']['general']['helpchan'] = nil
default['atheme-services']['general']['helpurl'] = nil
default['atheme-services']['general']['silent'] = false
default['atheme-services']['general']['verbose_wallops'] = false
default['atheme-services']['general']['join_chans'] = true
default['atheme-services']['general']['leave_chans'] = true
default['atheme-services']['general']['secure'] = false
default['atheme-services']['general']['uflags'] = "hidemail;"
default['atheme-services']['general']['cflags'] = "verbose; guard;"
default['atheme-services']['general']['raw'] = false
default['atheme-services']['general']['flood_msgs'] = 7
default['atheme-services']['general']['flood_time'] = 10
default['atheme-services']['general']['ratelimit_uses'] = 5
default['atheme-services']['general']['ratelimit_period'] = 60
default['atheme-services']['general']['kline_time'] = 7
default['atheme-services']['general']['clone_time'] = 0
default['atheme-services']['general']['commit_interval'] = 5
default['atheme-services']['general']['default_clone_allowed'] = 5
default['atheme-services']['general']['default_clone_warn'] = 4
default['atheme-services']['general']['clone_identified_increase_limit'] = true
default['atheme-services']['general']['uplink_sendq_limit'] = "1048576"
default['atheme-services']['general']['language'] = "en"
default['atheme-services']['general']['exempts'] = ""
default['atheme-services']['general']['allow_taint'] = false
default['atheme-services']['general']['immune_level'] = "immune"

default['atheme-services']['conf_files_to_include'] = []

ircop_config = <<-CONF
	privs {
		special:ircop;
	};

	privs {
		user:auspex;
		user:admin;
		user:sendpass;
		user:vhost;
		user:mark;
	};

	privs {
		chan:auspex;
		chan:admin;
		chan:cmodes;
		chan:joinstaffonly;
	};

	privs {
		general:auspex;
		general:helper;
		general:viewprivs;
		general:flood;
	};

	privs {
		operserv:omode;
		operserv:akill;
		operserv:jupe;
		operserv:global;
	};

	privs {
		group:auspex;
		group:admin;
	};
CONF

sra_config = <<-CONF
	/* You can inherit privileges from a lower operclass. */
	extends "ircop";

	privs {
		user:hold;
		user:regnolimit;
	};

	privs {
		general:metadata;
		general:admin;
	};

	privs {
		#operserv:massakill;
		#operserv:akill-anymask;
		operserv:noop;
		operserv:grant;
		#operserv:override;
	};

	/* needoper
	 * Only grant privileges to IRC users in this oper class if they
	 * are opered; other use of privilege (channel succession, XMLRPC,
	 * etc.) is unaffected by this.
	 */
	needoper;
CONF

default['atheme-services']['operclasses'] = {
  "ircop" => ircop_config,
  "sra" => sra_config
}

