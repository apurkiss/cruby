#include "ruby/ruby.h"
#include "ruby/encoding.h"
#include "library.h"

static VALUE add(VALUE self, VALUE value) {
    unsigned long long int number_in = NUM2DBL(value);
    unsigned long long int number_out = add_from_library(number_in);
    return DBL2NUM(number_out);
}

static VALUE add_optimized(VALUE self, VALUE value) {
    unsigned long long int number_in = NUM2DBL(value);
    unsigned long long int number_out = add_optimized_from_library(number_in);
    return DBL2NUM(number_out);
}

static VALUE divide(VALUE self, VALUE value) {
    unsigned long long int number_in = NUM2DBL(value);
    unsigned long long int number_out = divide_from_library(number_in);
    return DBL2NUM(number_out);
}

static VALUE divide_optimized(VALUE self, VALUE value) {
    unsigned long long int number_in = NUM2DBL(value);
    unsigned long long int number_out = divide_optimized_from_library(number_in);
    return DBL2NUM(number_out);
}

static VALUE multiply(VALUE self, VALUE value) {
    unsigned long long int number_in = NUM2DBL(value);
    unsigned long long int number_out = multiply_from_library(number_in);
    return DBL2NUM(number_out);
}

static VALUE multiply_optimized(VALUE self, VALUE value) {
    unsigned long long int number_in = NUM2DBL(value);
    unsigned long long int number_out = multiply_optimized_from_library(number_in);
    return DBL2NUM(number_out);
}

void Init_extension(void) {
    VALUE Cruby = rb_define_module("Cruby");
    VALUE Cperf = rb_define_class_under(Cruby, "Cperf", rb_cObject);

    rb_define_singleton_method(Cperf, "add", add, 1);
    rb_define_singleton_method(Cperf, "add_optimized", add_optimized, 1);
    rb_define_singleton_method(Cperf, "divide", divide, 1);
    rb_define_singleton_method(Cperf, "divide_optimized", divide_optimized, 1);
    rb_define_singleton_method(Cperf, "multiply", multiply, 1);
    rb_define_singleton_method(Cperf, "multiply_optimized", multiply_optimized, 1);
}
