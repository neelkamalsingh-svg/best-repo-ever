trigger RestrictContactByName on Contact (before insert, before update) {
    for (Contact con : Trigger.new) {
        // Check if the last name is 'INVALIDNAME'
        if (con.LastName == 'INVALIDNAME') {
            con.addError('Contacts with the last name "INVALIDNAME" cannot be inserted or updated.');
        }
    }
}