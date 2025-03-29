from behave import given, when, then
from eventstory.greeter import Greeter

@given('the user is named "{name}"')
def step_user_named(context, name):
    context.name = name

@when("I greet the user")
def step_greet_user(context):
    greeter = Greeter()
    context.result = greeter.say_hello(context.name)

@then('I should see "Hello, Alice!"')
def step_check_output(context):
    assert context.result == "Hello, Alice!"
