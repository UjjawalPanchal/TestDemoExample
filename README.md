# test_project

Test Project foe introduction

    void main() {
        String firstName = 'John';
        String lastName = 'Doe';
        int age = 30;
        List items = ['Apple', 'Banana'];
        
        // 1. Simple variable interpolation
        String message1 = 'Hello, $firstName $lastName!';
        print(message1); // Output: Hello, John Doe!
        
        // 2. Interpolating an integer (Dart automatically calls toString())
        String message2 = 'You are $age years old.';
        print(message2); // Output: You are 30 years old.
        
        // 3. Interpolating expressions or property access
        String message3 = 'Next year, you will be ${age + 1}.';
        print(message3); // Output: Next year, you will be 31.
        
        String message4 = 'Your name has ${firstName.length} characters.';
        print(message4); // Output: Your name has 4 characters.
        
        String message5 = 'The first item is ${items[0].toUpperCase()}.';
        print(message5); // Output: The first item is APPLE.
    }