package com.bmuschko.messenger

import spock.lang.Specification

class MessengerTest extends Specification {
    def messenger = new Messenger()

    void "can get message"() {
        when:
        def msg = messenger.getMessage()

        then:
        msg == 'Hello World!'
    }
}