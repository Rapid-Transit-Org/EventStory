from eventstory.greeter import Greeter

def test_greeter_says_hello():
    greeter = Greeter()
    result = greeter.say_hello("Alice")
    assert result == "Hello, Alice!"
