deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

SURFACE_PRO_6_FLASH = '''
	Press and hold the Volume Down button and press the Power button. Release the Power button but keep pressing the Volume Down button until the windows logo disappears.
'''

SURFACE_PRO_6_POWERON = 'Press the Power button.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	SURFACE_PRO_6_POWERON
]

module.exports =
	version: 1
	slug: 'surface-pro-6'
	name: 'Microsoft Surface 6'
	arch: 'amd64'
	state: 'new'
	private: false

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_USB
		instructions.EJECT_USB
		instructions.FLASHER_WARNING
		SURFACE_PRO_6_FLASH
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/intel-nuc/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/intel-nuc/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/intel-nuc/nodejs/'

	yocto:
		machine: 'surface-pro-6'
		image: 'resin-image-flasher'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-surface-pro-6.resinos-img'
		deployFlasherArtifact: 'resin-image-flasher-surface-pro-6.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	options: [ networkOptions.group ]

	initialization: commonImg.initialization
