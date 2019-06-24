package com.bmuschko.messenger;

import org.apache.commons.lang.StringUtils;

public class Messenger {
    public String getMessage() {
        return StringUtils.upperCase("Hello World!");
    }
}