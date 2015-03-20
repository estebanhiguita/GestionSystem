// Copyright (c) 2015, <ARISTA DEV>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:GestionSystem/reverser.dart';
import 'package:route_hierarchical/client.dart';
import 'package:swiper/swiper.dart';

void main() {
    // Initialize the Swiper.
    Swiper swiper = new Swiper(querySelector('.swiper'), speed: 600);
    
    // Set up method calls for button clicks.
    ButtonElement prevButton = querySelector('#previous-button')
       ..onClick.listen((_) => swiper.prev());
    ButtonElement nextButton = querySelector('#next-button')
       ..onClick.listen((_) => swiper.next());
    
    InputElement moveInput = querySelector('#move-input');
    ButtonElement moveButton = querySelector('#move-button')..onClick.listen((_) {
     int index = int.parse(moveInput.value, onError: (txt) => 0);
     moveInput.value = index.toString();
     swiper.moveToIndex(index);
    });
    
    // Write events to TextArea.
    TextAreaElement events = querySelector('#events');
    swiper.onPageChange.listen((index) {
     append(events, 'PageChange Event: index=${index}\n');
    });
    swiper.onPageTransitionEnd.listen((index) {
     append(events, 'TransitionEnd Event: index=${index}\n');
    });
}

void append(TextAreaElement textArea, String text) {
  textArea.appendText(text);
  textArea.scrollTop = textArea.scrollHeight;
}
