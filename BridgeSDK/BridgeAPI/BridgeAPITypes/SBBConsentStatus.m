//
//  SBBConsentStatus.m
//
//	Copyright (c) 2015, Sage Bionetworks
//	All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted provided that the following conditions are met:
//	    * Redistributions of source code must retain the above copyright
//	      notice, this list of conditions and the following disclaimer.
//	    * Redistributions in binary form must reproduce the above copyright
//	      notice, this list of conditions and the following disclaimer in the
//	      documentation and/or other materials provided with the distribution.
//	    * Neither the name of Sage Bionetworks nor the names of BridgeSDk's
//		  contributors may be used to endorse or promote products derived from
//		  this software without specific prior written permission.
//
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//	DISCLAIMED. IN NO EVENT SHALL SAGE BIONETWORKS BE LIABLE FOR ANY
//	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "SBBConsentStatus.h"

@implementation SBBConsentStatus

#pragma mark Abstract method overrides

// Custom logic goes here.

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.consented = [aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(consented))];
        self.consentedValue = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(consentedValue))] boolValue];
        self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(name))];
        self.required = [aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(required))];
        self.requiredValue = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(requiredValue))] boolValue];
        self.signedMostRecentConsent = [aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(signedMostRecentConsent))];
        self.signedMostRecentConsentValue = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(signedMostRecentConsentValue))] boolValue];
        self.subpopulationGuid = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(subpopulationGuid))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.consented forKey:NSStringFromSelector(@selector(consented))];
    [aCoder encodeObject:[NSNumber numberWithBool:self.consentedValue] forKey:NSStringFromSelector(@selector(consentedValue))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.required forKey:NSStringFromSelector(@selector(required))];
    [aCoder encodeObject:[NSNumber numberWithBool:self.requiredValue] forKey:NSStringFromSelector(@selector(requiredValue))];
    [aCoder encodeObject:self.signedMostRecentConsent forKey:NSStringFromSelector(@selector(signedMostRecentConsent))];
    [aCoder encodeObject:[NSNumber numberWithBool:self.signedMostRecentConsentValue] forKey:NSStringFromSelector(@selector(signedMostRecentConsentValue))];
    [aCoder encodeObject:self.subpopulationGuid forKey:NSStringFromSelector(@selector(subpopulationGuid))];
}

#pragma mark - NSCopy

- (id)copyWithZone:(NSZone *)zone {
    SBBConsentStatus *copy = [super copyWithZone:zone];
    copy.consented = self.consented;
    copy.consentedValue = self.consentedValue;
    copy.name = self.name;
    copy.required = self.required;
    copy.requiredValue = self.requiredValue;
    copy.signedMostRecentConsent = self.signedMostRecentConsent;
    copy.signedMostRecentConsentValue = self.signedMostRecentConsentValue;
    copy.subpopulationGuid = self.subpopulationGuid;
    return copy;
}

#pragma mark - Equality

- (BOOL)isEqual:(id)object {
    typeof(self) castObject = object;
    return [super isEqual:object] &&
    [self.consented isEqual:castObject.consented] &&
    [[NSNumber numberWithBool:self.consentedValue] isEqual:[NSNumber numberWithBool:castObject.consentedValue]] &&
    [self.name isEqual:castObject.name] &&
    [self.required isEqual:castObject.required] &&
    [[NSNumber numberWithBool:self.requiredValue] isEqual:[NSNumber numberWithBool:castObject.requiredValue]] &&
    [self.signedMostRecentConsent isEqual:castObject.signedMostRecentConsent] &&
    [[NSNumber numberWithBool:self.signedMostRecentConsentValue] isEqual:[NSNumber numberWithBool:castObject.signedMostRecentConsentValue]] &&
    [self.subpopulationGuid isEqual:castObject.subpopulationGuid];
}

- (NSUInteger)hash {
    return super.hash ^
    self.consented.hash ^
    [NSNumber numberWithBool:self.consentedValue].hash ^
    self.name.hash ^
    self.required.hash ^
    [NSNumber numberWithBool:self.requiredValue].hash ^
    self.signedMostRecentConsent.hash ^
    [NSNumber numberWithBool:self.signedMostRecentConsentValue].hash ^
    self.subpopulationGuid.hash;
}

@end
