local var_0_0 = require("Overkiz.Persistence")
local var_0_1 = require("Overkiz.conf")

return {
	wificountryFile = os.getenv("INTERNAL_WIFI_COUNTRY_FILE") or "",
	wifiAPConfigFile = os.getenv("INTERNAL_WIFI_AP_CONFIG_FILE") or "/etc/security/wifivars",
	bluetoothCertFile = os.getenv("INTERNAL_BLUETOOTH_CERT_FILE") or "/etc/security/client.crt",
	bluetoothKeyFile = os.getenv("INTERNAL_BLUETOOTH_KEY_FILE") or "/etc/security/client.key",
	connmanAutoConfigFile = os.getenv("INTERNAL_CONNMAN_AUTO_CONFIG") or "/var/volatile/lib/connman/auto.config",
	crlFile = os.getenv("INTERNAL_CRL_FILE") or "/persistent/root/etc/ssl/local-apps-crl.pem",
	crlUploadUrl = os.getenv("INTERNAL_CRL_UPLOAD_URL") or "/ca/local-apps.crl",
	crlMd5UploadUrl = os.getenv("INTERNAL_CRL_MD5_UPLOAD_URL") or "/ca/local-apps.crl.md5",
	appCA = os.getenv("INTERNAL_APP_CA_FILE") or "/etc/security/app_ca.crt",
	persistenceType = var_0_0.Type.RESET,
	appLoader = {
		configsSearchPattern = os.getenv("INTERNAL_APPLOADER_CONFIGS_SEARCH_PATTERN") or ""
	},
	persistentSysConfDir = os.getenv("INTERNAL_PERSISTENT_SYSCONFDIR") or "/persistent/root/etc",
	ntpFile = var_0_1.CORE_NTP_SYNC_PATH,
	tskModalias = os.getenv("INTERNAL_MODALIAS") or "v1BC7p0022d1670dcEFdsc02dp01ic02isc02ip00in02",
	updateStatusPath = os.getenv("INTERNAL_UPDATE_STATUS_PATH") or "/persistent/boot/update/version-hash.txt",
	path = {
		logFile = "/apps/overkiz/http-log/etc/properties.xml",
		rtcDev = "/dev/rtc",
		imageId = os.getenv("INTERNAL_KIZOS_IMAGEID") or "unknown",
		revision = os.getenv("INTERNAL_KIZOS_REVISION") or "unknown",
		version = os.getenv("INTERNAL_KIZOS_VERSION") or "unknown",
		scriptDir = os.getenv("INTERNAL_SCRIPTSDIR") or "/scripts",
		recoveryFile = os.getenv("INTERNAL_RECOVERYID_FILE") or "",
		recoveredFile = os.getenv("INTERNAL_RECOVERED_FILE") or "/etc/recovered",
		bootFile = os.getenv("INTERNAL_BOOT_FILE") or "/tmp/boot",
		bootnextFile = os.getenv("INTERNAL_BOOTNEXT_FILE") or "",
		bootmodeFile = os.getenv("INTERNAL_BOOTMODE_FILE") or "",
		reasonFile = os.getenv("INTERNAL_RESETREASON_FILE") or "/sys/reset/reason",
		localtimeFile = os.getenv("INTERNAL_LOCALTIME_SYMLINK") or "/etc/localtime",
		zoneinfoFile = os.getenv("INTERNAL_ZONEINFO_PATH") or "/usr/share/zoneinfo"
	}
}
