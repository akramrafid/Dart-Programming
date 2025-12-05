// Asynchronous Programming | Futures | async & await | Streams | Future chaining

import 'dart:async';

// ============= FUTURES BASICS =============
class DataFetcher {
  // Simple future that completes after delay
  Future<String> fetchUserData(String userId) {
    return Future.delayed(Duration(seconds: 2), () {
      return 'User: $userId | Name: John Doe';
    });
  }

  // Future that resolves immediately
  Future<int> calculateSum(int a, int b) {
    return Future.value(a + b);
  }

  // Future that throws an error
  Future<String> fetchDataWithError(String userId) {
    return Future.delayed(Duration(seconds: 1), () {
      throw Exception('Failed to fetch data for $userId');
    });
  }
}

// ============= ASYNC & AWAIT USAGE =============
class UserService {
  final DataFetcher fetcher = DataFetcher();

  // Using async and await
  Future<String> getUserInfo(String userId) async {
    try {
      print('Fetching user data for $userId...');
      String userData = await fetcher.fetchUserData(userId);
      print('✓ User data received');
      return userData;
    } catch (e) {
      print('✗ Error: $e');
      return 'Error fetching user';
    }
  }

  // Multiple await calls
  Future<String> getUserWithDetails(String userId) async {
    try {
      String userInfo = await fetcher.fetchUserData(userId);
      int userId_int = int.parse(userId);
      int score = await fetcher.calculateSum(userId_int, 100);
      return '$userInfo | Score: $score';
    } catch (e) {
      return 'Error: $e';
    }
  }
}

// ============= FUTURE CHAINING (.then, .catchError) =============
class OrderService {
  Future<String> getOrderDetails(String orderId) {
    return Future.delayed(Duration(seconds: 1), () {
      return 'Order $orderId: Item X, Price: \$99.99';
    });
  }

  Future<String> processOrder(String orderId) {
    return getOrderDetails(orderId)
        .then((orderInfo) {
          print('Order retrieved: $orderInfo');
          return 'Processing: $orderInfo';
        })
        .then((processingInfo) {
          print('Order processed');
          return 'Completed: $processingInfo';
        })
        .catchError((error) {
          print('✗ Error in order processing: $error');
          return 'Order processing failed';
        });
  }

  Future<void> chainMultipleFutures(String orderId) {
    return getOrderDetails(orderId)
        .then((details) {
          print('Step 1: Retrieved - $details');
          return Future.delayed(Duration(seconds: 1));
        })
        .then((_) {
          print('Step 2: Payment processing...');
          return Future.delayed(Duration(seconds: 1));
        })
        .then((_) {
          print('Step 3: Order confirmation sent');
        })
        .catchError((error) {
          print('✗ Error: $error');
        });
  }
}

// ============= STREAMS BASICS =============
class DataStream {
  // Stream that emits numbers
  Stream<int> countStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  // Stream that emits data from a list
  Stream<String> itemStream() async* {
    List<String> items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
    for (String item in items) {
      await Future.delayed(Duration(milliseconds: 500));
      yield item;
    }
  }

  // Stream with error handling
  Stream<int> numbersWithError() async* {
    for (int i = 1; i <= 5; i++) {
      if (i == 3) {
        throw Exception('Error at number 3');
      }
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  // Broadcast stream - multiple listeners
  Stream<String> broadcastStream() {
    StreamController<String> controller = StreamController<String>.broadcast();

    Future.delayed(Duration(seconds: 1), () {
      controller.add('Event 1');
    });
    Future.delayed(Duration(seconds: 2), () {
      controller.add('Event 2');
    });
    Future.delayed(Duration(seconds: 3), () {
      controller.add('Event 3');
      controller.close();
    });

    return controller.stream;
  }
}

// ============= LISTENING TO MULTIPLE ASYNC TASKS =============
class MultipleAsyncTasks {
  Future<String> task1() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Task 1 completed';
  }

  Future<String> task2() async {
    await Future.delayed(Duration(seconds: 1));
    return 'Task 2 completed';
  }

  Future<String> task3() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Task 3 completed';
  }

  // Wait for all futures to complete
  Future<List<String>> runAllTasks() async {
    print('Starting all tasks...');
    List<String> results = await Future.wait([task1(), task2(), task3()]);
    print('All tasks completed');
    return results;
  }

  // Race - complete with first finished
  Future<String> raceTask() async {
    return await Future.any([task1(), task2(), task3()]);
  }

  // Sequential execution
  Future<String> sequentialTasks() async {
    String r1 = await task1();
    print(r1);
    String r2 = await task2();
    print(r2);
    String r3 = await task3();
    print(r3);
    return 'All sequential tasks done';
  }

  // Parallel execution with error handling
  Future<void> parallelWithErrorHandling() async {
    try {
      List<String> results = await Future.wait(
        [task1(), task2(), task3()],
        eagerError: true,
      );
      print('Results: $results');
    } catch (e) {
      print('✗ Error: $e');
    }
  }
}

// ============= CUSTOM STREAM CONTROLLER =============
class SimpleEventEmitter {
  final StreamController<String> _controller = StreamController<String>();

  Stream<String> get eventStream => _controller.stream;

  void emitEvent(String event) {
    _controller.add(event);
  }

  void closeStream() {
    _controller.close();
  }
}

// ============= MAIN FUNCTION =============
void main() async {
  print('========== ASYNCHRONOUS PROGRAMMING DEMO ==========\n');

  // ===== FUTURES BASICS =====
  print('--- FUTURES BASICS ---\n');
  DataFetcher fetcher = DataFetcher();

  Future<String> future1 = fetcher.fetchUserData('123');
  print('Future created (not waiting)');
  String result = await future1;
  print('Result: $result\n');

  // ===== ASYNC & AWAIT =====
  print('--- ASYNC & AWAIT ---\n');
  UserService userService = UserService();
  String userInfo = await userService.getUserInfo('456');
  print('User Info: $userInfo\n');

  String userDetails = await userService.getUserWithDetails('789');
  print('User Details: $userDetails\n');

  // ===== FUTURE CHAINING =====
  print('--- FUTURE CHAINING (.then, .catchError) ---\n');
  OrderService orderService = OrderService();

  String orderResult = await orderService.processOrder('ORD001');
  print('Final result: $orderResult\n');

  print('--- CHAINING MULTIPLE OPERATIONS ---\n');
  await orderService.chainMultipleFutures('ORD002');
  print('');

  // ===== STREAMS BASICS =====
  print('--- STREAMS BASICS ---\n');
  DataStream dataStream = DataStream();

  print('Counting stream:');
  await for (int count in dataStream.countStream()) {
    print('Count: $count');
  }
  print('');

  print('Item stream:');
  await for (String item in dataStream.itemStream()) {
    print('Item: $item');
  }
  print('');

  // ===== STREAM WITH ERROR =====
  print('--- STREAM WITH ERROR HANDLING ---\n');
  try {
    await for (int num in dataStream.numbersWithError()) {
      print('Number: $num');
    }
  } catch (e) {
    print('✗ Stream error: $e');
  }
  print('');

  // ===== BROADCAST STREAM =====
  print('--- BROADCAST STREAM (Multiple Listeners) ---\n');
  Stream<String> broadcastStream = dataStream.broadcastStream();

  broadcastStream.listen((event) {
    print('Listener 1: $event');
  });

  broadcastStream.listen((event) {
    print('Listener 2: $event');
  });

  await Future.delayed(Duration(seconds: 4));
  print('');

  // ===== LISTENING TO MULTIPLE ASYNC TASKS =====
  print('--- MULTIPLE ASYNC TASKS ---\n');
  MultipleAsyncTasks multiTasks = MultipleAsyncTasks();

  // Run all tasks in parallel
  List<String> results = await multiTasks.runAllTasks();
  for (String result in results) {
    print('✓ $result');
  }
  print('');

  // Race task
  print('--- RACE TASK (First to complete) ---');
  String fastest = await multiTasks.raceTask();
  print('✓ First completed: $fastest\n');

  // Sequential tasks
  print('--- SEQUENTIAL TASKS ---\n');
  String sequential = await multiTasks.sequentialTasks();
  print('✓ $sequential\n');

  // ===== CUSTOM STREAM CONTROLLER =====
  print('--- CUSTOM STREAM CONTROLLER ---\n');
  SimpleEventEmitter emitter = SimpleEventEmitter();

  emitter.eventStream.listen((event) {
    print('Event received: $event');
  });

  emitter.emitEvent('Event 1');
  await Future.delayed(Duration(milliseconds: 500));
  emitter.emitEvent('Event 2');
  await Future.delayed(Duration(milliseconds: 500));
  emitter.emitEvent('Event 3');

  await Future.delayed(Duration(seconds: 1));
  emitter.closeStream();

  print('\n========== DEMO COMPLETED ==========');
}