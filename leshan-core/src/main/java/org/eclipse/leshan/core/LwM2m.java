/*******************************************************************************
 * Copyright (c) 2017 Sierra Wireless and others.
 * 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 * 
 * The Eclipse Public License is available at
 *    http://www.eclipse.org/legal/epl-v20.html
 * and the Eclipse Distribution License is available at
 *    http://www.eclipse.org/org/documents/edl-v10.html.
 * 
 * Contributors:
 *     Sierra Wireless - initial API and implementation
 *******************************************************************************/
package org.eclipse.leshan.core;

public interface LwM2m {

    /**
     * Version of LWM2M specification.
     */
    public enum Version {
        V1_0("1.0"), V1_1("1.1");

        private String value;

        Version(String version) {
            value = version;
        }

        @Override
        public String toString() {
            return value;
        }

        public static boolean isSupported(String version) {
            for (Version enumVersion : Version.values()) {
                if (enumVersion.value.equals(version)) {
                    return true;
                }
            }
            return false;
        }

        public static Version lastSupported() {
            return V1_1;
        }
    }

    /** The supported version of the specification */
    static final String VERSION = "1.0";

    /** The default CoAP port for unsecured CoAP communication */
    static final int DEFAULT_COAP_PORT = 5683;

    /** The default CoAP port for secure CoAP communication */
    static final int DEFAULT_COAP_SECURE_PORT = 5684;
}
