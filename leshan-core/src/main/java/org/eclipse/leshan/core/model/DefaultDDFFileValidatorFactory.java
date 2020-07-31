/*******************************************************************************
 * Copyright (c) 2020 Sierra Wireless and others.
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
package org.eclipse.leshan.core.model;

import org.eclipse.leshan.core.LwM2m.Version;

/**
 * Create {@link DefaultDDFFileValidator}.
 * <p>
 * Support LWM2M version 1.0 and 1.1.
 */

public class DefaultDDFFileValidatorFactory implements DDFFileValidatorFactory {
    @Override
    public DDFFileValidator create(Version lwm2mVersion) {
        return new DefaultDDFFileValidator(lwm2mVersion);
    }
}