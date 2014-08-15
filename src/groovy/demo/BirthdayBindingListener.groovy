package demo

import org.grails.databinding.events.DataBindingListenerAdapter

class BirthdayBindingListener extends DataBindingListenerAdapter {

    boolean supports(Class c) {
        Birthday.isAssignableFrom c
    }

    void afterBinding(target, errors) {
        // simple example, just for demonstration purposes...

        if(target.year && target.month && target.day) {
            def now = Calendar.instance
            now.clear()
            now.with {
                set YEAR, target.year
                set MONTH, target.month - 1
                set DATE, target.day
            }
            target.date = now.time
        }
    }
}