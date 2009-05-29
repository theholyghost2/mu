
#ifndef SMOP_S1P_H
#define SMOP_S1P_H

#include <smop/base.h>
extern SMOP__Object* SMOP__S1P__ritest;
extern SMOP__Object* SMOP__S1P__LexicalScope;
extern SMOP__Object* SMOP__S1P__FlattenedScope;
extern SMOP__Object* SMOP__S1P__LexicalPrelude;
extern SMOP__Object* SMOP__S1P__Code;
extern SMOP__Object* SMOP__S1P__Scalar;
extern SMOP__Object* SMOP__S1P__Package;
extern SMOP__Object* SMOP__S1P__Array;
extern SMOP__Object* SMOP__MildewSOLoader;
extern SMOP__Object* SMOP__ControlExceptionReturn;
extern SMOP__Object* SMOP__S1P__AdhocSignature;

void smop_s1p_lexical_prelude_insert(SMOP__Object* interpreter,char* name,SMOP__Object* obj);

void smop_s1p_init(SMOP__Object* interpreter);
void smop_s1p_destr(SMOP__Object* interpreter);
void smop_s1p_lexicalscope_init(SMOP__Object* interpreter);
void smop_s1p_lexicalscope_destr(SMOP__Object* interpreter);
void smop_s1p_lexical_prelude_init(SMOP__Object* interpreter);
void smop_s1p_lexical_prelude_destr(SMOP__Object* interpreter);
void smop_s1p_flattenedscope_init(SMOP__Object* interpreter);
void smop_s1p_flattenedscope_destr(SMOP__Object* interpreter);

void smop_s1p_proto_init(SMOP__Object* interpreter);
void smop_s1p_proto_destr(SMOP__Object* interpreter);
void smop_s1p_scalar_destr(SMOP__Object* interpreter);
void smop_s1p_scalar_init(SMOP__Object* interpreter);

void smop_s1p_hash_init(SMOP__Object* interpreter);
void smop_s1p_hash_destr(SMOP__Object* interpreter);

void smop_s1p_hash_bvalue_init(SMOP__Object* interpreter);
void smop_s1p_hash_bvalue_destr(SMOP__Object* interpreter);

void smop_s1p_code_init(SMOP__Object* interpreter);
void smop_s1p_code_destr(SMOP__Object* interpreter);

void smop_s1p_ccode_init(SMOP__Object* interpreter);
void smop_s1p_ccode_destr(SMOP__Object* interpreter);

void smop_s1p_io_init(SMOP__Object* interpreter);
void smop_s1p_io_destr(SMOP__Object* interpreter);

void smop_s1p_loader_init(SMOP__Object* interpreter);
void smop_s1p_loader_destr(SMOP__Object* interpreter);

void smop_s1p_adhocsignature_init(SMOP__Object* interpreter);
void smop_s1p_adhocsignature_destr(SMOP__Object* interpreter);

void smop_s1p_array_init(SMOP__Object* interpreter);
void smop_s1p_array_destr(SMOP__Object* interpreter);

void smop_s1p_array_proxy_init(SMOP__Object* interpreter);
void smop_s1p_array_proxy_destr(SMOP__Object* interpreter);

void smop_s1p_out_of_items_exception_init(SMOP__Object* interpreter);

void smop_s1p_out_of_items_exception_destr(SMOP__Object* interpreter);

void smop_s1p_package_init(SMOP__Object* interpreter);
void smop_s1p_package_destr(SMOP__Object* interpreter);
void smop_s1p_insert_primitives(SMOP__Object* interpreter,SMOP__Object* primitives);

SMOP__Object* SMOP__S1P__Scalar_create(SMOP__Object* interpreter,SMOP__Object* initial_value);

SMOP__Object* SMOP__Proto__create(SMOP__Object* delegate_to_RI);
SMOP__Object* SMOP__S1P__Hash_create(SMOP__Object* interpreter);
SMOP__Object* SMOP__S1P__Array_create(SMOP__Object* interpreter);
SMOP__Object* SMOP__S1P__Hash_BValue_create(SMOP__Object* interpreter, SMOP__Object* owner, SMOP__Object* key);

SMOP__Object* SMOP__S1P__IO_create(SMOP__Object* interpreter);

SMOP__Object* SMOP__S1P__CCode_create(SMOP__Object* (*ccode) (SMOP__Object* interpreter,
                                                            SMOP__Object* ccode,
                                                            SMOP__Object* capture));
SMOP__Object* SMOP__S1P__Scalar_FETCH(SMOP__Object* object);

#endif
