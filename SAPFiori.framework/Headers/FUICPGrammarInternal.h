//
//  FUICPGrammarInternal.h
//  CoreParse
//
//  Created by Tom Davie on 04/06/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FUICPGrammar.h"

@interface FUICPGrammar (FUICPGrammarInternal)

- (FUICPGrammar *)augmentedGrammar;

- (NSUInteger)indexOfRule:(FUICPRule *)rule;

- (NSSet *)lr0Closure:(NSSet *)i;
- (NSSet *)lr0GotoKernelWithItems:(NSSet *)i symbol:(FUICPGrammarSymbol *)symbol;
- (NSArray *)lr0Kernels;

- (NSSet *)lr1Closure:(NSSet *)i;
- (NSSet *)lr1GotoKernelWithItems:(NSSet *)i symbol:(FUICPGrammarSymbol *)symbol;

- (NSSet *)follow:(NSString *)name;
- (NSSet *)first:(NSArray *)obj;

- (NSString *)uniqueSymbolNameBasedOnName:(NSString *)name;
- (NSString *)symbolNameNotInSet:(NSSet *)symbols basedOnName:(NSString *)name;

- (NSArray *)tidyRightHandSides:(NSArray *)oldRules error:(NSError **)error;
- (NSSet *)collectRHSElementsForNewRules:(NSArray *)rightHandSide;
- (NSDictionary *)nameNewRules:(NSSet *)rhsElements withRules:(NSArray *)oldRules;
- (NSArray *)addRHSRules:(NSDictionary *)rules toRules:(NSArray *)oldRules;

@end
