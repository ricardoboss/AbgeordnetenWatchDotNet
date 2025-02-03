namespace AbgeordnetenWatch;

enum CommitteeRole {
	@doc("Vorsitz")
	chairperson,

	@doc("Stellvertr. Vorsitz")
	vice_chairperson,

	@doc("Obmann/-frau")
	foreperson,

	@doc("Sprecher:in")
	spokesperson,

	@doc("Stellvertr. Sprecher:in")
	alternate_spokesperson,

	@doc("Schriftführer:in")
	secretary,

	@doc("Stellvertr. Schriftführer:in")
	alternate_secretary,

	@doc("Beratendes Mitglied")
	advisory_member,

	@doc("Mitwirkungsberechtigtes Mitglied")
	eligible_member,

	@doc("Mitglied")
	member,

	@doc("Stellvertr. Mitglied")
	alternate_member,
}
