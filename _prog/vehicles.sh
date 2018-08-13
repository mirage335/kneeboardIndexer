##### Core

_guide_directories() {
	local guideExport="$1"
	guideExport="$1"
	
	_guide_directory "$guideExport"/00-interface
	_guide_directory "$guideExport"/01-entry
	_guide_directory "$guideExport"/02-immediate
	_guide_directory "$guideExport"/03-hotas
	_guide_directory "$guideExport"/04-irregular
	_guide_directory "$guideExport"/05-controls
	_guide_directory "$guideExport"/20-preflight
	_guide_directory "$guideExport"/21-landing
	_guide_directory "$guideExport"/24-landing-ifr
	_guide_directory "$guideExport"/30-util
	_guide_directory "$guideExport"/31-nav
	_guide_directory "$guideExport"/32-comm
	_guide_directory "$guideExport"/33-autopilot
	_guide_directory "$guideExport"/40-tooling
	_guide_directory "$guideExport"/41-management
	_guide_directory "$guideExport"/42-sensors
	_guide_directory "$guideExport"/43-rwr
	_guide_directory "$guideExport"/50-weapons
	_guide_directory "$guideExport"/60-countermeasures
}

_dup_f5e() {
	local guideExport
	guideExport="$1"
	
	_na "$guideExport"/02-immediate
	_dup "$guideExport"/03-hotas
	_dup "$guideExport"/04-irregular
	_dup "$guideExport"/05-controls
	_dup "$guideExport"/21-landing
	_na "$guideExport"/24-landing-ifr
	_dup "$guideExport"/31-nav
	_dup "$guideExport"/32-comm
	_na "$guideExport"/33-autopilot
	_dup "$guideExport"/41-management
	_dup "$guideExport"/42-sensors
	_dup "$guideExport"/43-rwr
}

_checks_f5e_sequence() {
	_start
	
	_guide_directory "$f5e"/99-checks
	
	#_guide_directories "$f5e"
	#_dup_f5e "$f5e"
	
	_convert_pdf "$scriptLib"/Chucks_Guides/f5e.pdf "$f5e"/99-checks checks "$chucks_guides_density"
	
	_stop
}

_checks_f5e() {
	"$scriptAbsoluteLocation" _checks_f5e_sequence "$@"
}

_dup_fa18c() {
	local guideExport
	guideExport="$1"
	
	true
}

_checks_fa18c_sequence() {
	_start
	
	_guide_directory "$fa18c"/99-checks
	
	#_guide_directories "$fa18c"
	#_dup_fa18c "$fa18c"
	
	_convert_pdf "$scriptLib"/Chucks_Guides/fa18c.pdf "$fa18c"/99-checks checks "$chucks_guides_density"
	
	_stop
}

_checks_fa18c() {
	"$scriptAbsoluteLocation" _checks_fa18c_sequence "$@"
}

_checks() {
	_checks_f5e "$@" &
	_checks_fa18c "$@" &
}

_f5e() {
	local dirName
	dirName="$1"
	shift
	
	cp "$f5e"/99-checks/checks-"$@".png "$f5e"/"$dirName"
}

_guide_f5e() {
	_guide_directories "$f5e"
	_dup_f5e "$f5e"
	
	#Interface reference NEVER padded.
	cp "$scriptLib"/interface/f5e/* "$f5e"/00-interface
	
	#_f5e 02-immediate NULL
	#_pad_directory "$f5e"/02-immediate
	
	_f5e 03-hotas-dup 003
	_f5e 03-hotas-dup 021
	_f5e 03-hotas-dup 022
	_f5e 03-hotas-dup 024
	_f5e 03-hotas-dup 034
	_f5e 03-hotas-dup 039
	_pad_directory "$f5e"/03-hotas-dup
	
	_f5e 04-irregular-dup 038
	_pad_directory "$f5e"/04-irregular-dup
	
	cp "$f5e"/99-checks/checks-{008..023}.png "$f5e"/05-controls-dup
	_pad_directory "$f5e"/05-controls-dup
	
	#cp "$f5e"/02-immediate/*checks-*.png "$f5e"/01-entry/
	cp "$f5e"/03-hotas-dup/*checks-*.png "$f5e"/01-entry/
	cp "$f5e"/04-irregular-dup/*checks-*.png "$f5e"/01-entry/
	cp "$f5e"/05-controls-dup/*checks-*.png "$f5e"/01-entry/
	_pad_directory "$f5e"/01-entry
	
	
	cp "$f5e"/99-checks/checks-{025..030}.png "$f5e"/20-preflight
	_pad_directory "$f5e"/20-preflight
	
	cp "$f5e"/99-checks/checks-{032..033}.png "$f5e"/21-landing-dup
	_pad_directory "$f5e"/21-landing-dup
	
	cp "$f5e"/21-landing-dup/*checks-*.png "$f5e"/20-preflight/
	_pad_directory "$f5e"/20-preflight
	
	
	_f5e 31-nav-dup 061
	_f5e 31-nav-dup 062
	_f5e 31-nav-dup 063
	_rename 'checks-' '31-checks-' "$f5e"'/31-nav-dup/checks-'*'.png'
	_pad_directory "$f5e"/31-nav-dup
	
	_f5e 32-comm-dup 059
	_f5e 32-comm-dup 060
	_rename 'checks-' '32-checks-' "$f5e"'/32-comm-dup/checks-'*'.png'
	_pad_directory "$f5e"/32-comm-dup
	
	cp "$f5e"/31-nav-dup/*checks-*.png "$f5e"/30-util
	cp "$f5e"/32-comm-dup/*checks-*.png "$f5e"/30-util
	_pad_directory "$f5e"/30-util
	
	
	cp "$f5e"/99-checks/checks-043.png "$f5e"/41-management-dup/41-01-stores-checks-043.png
	cp "$f5e"/99-checks/checks-055.png "$f5e"/41-management-dup/41-02-jettison-checks-055.png
	cp "$f5e"/99-checks/checks-009.png "$f5e"/41-management-dup/41-03-iff-checks-009.png
	#_rename 'checks-' '41-checks-' "$f5e"'/41-management-dup/checks-'*'.png'
	_pad_directory "$f5e"/41-management-dup
	
	cp "$f5e"/99-checks/checks-{040..042}.png "$f5e"/42-sensors-dup
	_rename 'checks-' '42-checks-' "$f5e"'/42-sensors-dup/checks-'*'.png'
	_pad_directory "$f5e"/42-sensors-dup
	
	
	cp "$f5e"/99-checks/checks-057.png "$f5e"/43-rwr-dup/43-01-checks-057.png
	cp "$f5e"/99-checks/checks-013.png "$f5e"/43-rwr-dup/43-02-checks-013.png
	#_rename 'checks-' '42-checks-' "$f5e"'/43-rwr-dup/checks-'*'.png'
	_pad_directory "$f5e"/43-rwr-dup
	
	cp "$f5e"/41-management-dup/*checks-*.png "$f5e"/40-tooling
	cp "$f5e"/42-sensors-dup/*checks-*.png "$f5e"/40-tooling
	cp "$f5e"/43-rwr-dup/*checks-*.png "$f5e"/40-tooling
	_pad_directory "$f5e"/40-tooling
	
	cp "$f5e"/99-checks/checks-{044..054}.png "$f5e"/50-weapons
	_pad_directory "$f5e"/50-weapons
	
	_f5e 60-countermeasures 058
	_pad_directory "$f5e"/60-countermeasures
}

_guide_fa18c() {
	#_guide_directories "$fa18c"
	#_dup_fa18c "$fa18c"
	
	#Interface reference NEVER padded.
	cp "$scriptLib"/interface/fa18c/* "$fa18c"/00-interface
	
	#Most FA-18 kneeboard assembly is done manually.
	
	_pad_directory "$fa18c"/00-interface
	_pad_directory "$fa18c"/01-entry
	_pad_directory "$fa18c"/02-immediate
	_pad_directory "$fa18c"/03-hotas
	_pad_directory "$fa18c"/04-irregular
	_pad_directory "$fa18c"/05-controls
	_pad_directory "$fa18c"/20-preflight
	_pad_directory "$fa18c"/21-landing
	_pad_directory "$fa18c"/24-landing-ifr
	_pad_directory "$fa18c"/30-util
	_pad_directory "$fa18c"/31-nav
	_pad_directory "$fa18c"/32-comm
	_pad_directory "$fa18c"/33-autopilot
	_pad_directory "$fa18c"/40-tooling
	_pad_directory "$fa18c"/41-management
	_pad_directory "$fa18c"/42-sensors
	_pad_directory "$fa18c"/43-rwr
	_pad_directory "$fa18c"/50-weapons
	_pad_directory "$fa18c"/60-countermeasures
}

_guide() {
	_guide_f5e "$@"
	_guide_fa18c "$@"
}
