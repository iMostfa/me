
---
date: 2022-07-28 3:05
description: تجربة الانترڤيو في جوجل...
title: انترفيوهات تيكنكال - جوجل3
image: postThumps/googleICon.png
tags:  Arabic, Interviews
---

<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><title>ازاي تعمل Volume Casting  </title></head><body><article id="a5a2486b-105b-472a-bd98-2fe077751225" class="page sans"><header><h1 class="page-title">ازاي تعمل Volume Casting  </h1></header><div class="page-body"><p id="aec1fd03-21dd-4352-aff0-515237ab9c73" class="">
</p><p id="36533412-3457-4433-93fa-4d9a522bc5be" class="">
</p><p id="105fa5b9-8824-4b18-bfde-44ab37f26348" class="">في المدونة دي هنتكلم عن ازاي نعمل امبلمنتيشن لفيتشر مش موجودة في SceneKit بس علشان نعمل الامبلمنتيشن محتاجين نفهم اكتر من عن الكونسبت نفسه، بعدين نشوف ايه المشكلة اللي عندنا، بعدين نشوف ازاي ممكن نحلها بالكودينج</p><p id="dd01b8b4-07a7-4681-b36f-c37e872872c3" class="">
</p><h2 id="8395cba3-eb9a-4450-aec9-7831eccb22e0" class="">إيه هي الراي Ray</h2><p id="11bc9b9b-5251-4a42-8972-66b449bfaf74" class="">الراي في سياق الكمبيوتر جرافيكس و في سياق حديثنا النهاردة هي عبارة عن نقطة مع اتجاه، يعني تقدر تقول انه اسم آخر ل الڤيكتور</p><p id="b4d8ef52-5435-4bf9-8d14-6a82dc9bbca5" class="">و تقدر تتخيل الراي على انها قلم ليزر  في ايدك، ليه بوزيشن، وقطعا ليه اتجاه، اللي هو اتجاه الانارة</p><figure id="abd15973-0e07-4c6a-ac43-474c71f5a487" class="image"><a href="../../postsImages/Volume-casting/Screen_Shot_2022-08-05_at_8.18.18_PM.png"><img style="width:958px" src="../../postsImages/Volume-casting/Screen_Shot_2022-08-05_at_8.18.18_PM.png"/></a></figure><p id="6a89b765-1ba8-45e6-8132-f42e3a75543c" class="">
</p><p id="6e8d8370-8b73-47ed-a877-8abe3716940b" class="">في الصورة </p><p id="195f8d76-4625-4e04-8dac-abcea017e649" class="">rPos = ray position in the space</p><p id="cc7e495a-9895-49b5-a1f7-a99aeb33f601" class="">rDir = ray dieraction in the space</p><h2 id="522ae23d-1a7c-4779-b837-d8bd61713b18" class="">ايه هو الراي-كاستينج Ray Casting</h2><p id="7b95ff68-076b-44cf-b236-392a34712a92" class="">الراي كاستينج هو عملية بنحاول نعرف فيها، اذا الراي اللي عندنا هتتقاطع مع اي جزء في السبيس ولا لا
</p><p id="dbffe382-1d8f-437f-abfa-4a4217f7c0dd" class="">لأنه الراي ليها نقطة واتجاه تقدر تمدها في السبيس براحتك، في الصورة دي الراي تم مدها في الفرغ، لغاية ما قطعت الكورة الكبيرة في النص، وبكدا نكون عرفنا انه الراي دي، بتقطع الكورة اللي في النص.. </p><figure id="768c3c1a-c447-4540-a4d7-1b0a61698d66" class="image"><a href="../../postsImages/Volume-casting/Illustration-of-raycasting-A-ray-is-cast-from-the-viewer-through-a-pixel-on-the.png"><img style="width:850px" src="../../postsImages/Volume-casting/Illustration-of-raycasting-A-ray-is-cast-from-the-viewer-through-a-pixel-on-the.png"/></a></figure><p id="724e5764-10fb-4058-bba0-f432d369957e" class="">
</p><h2 id="07148c73-f75a-44ac-886e-433d34e4c501" class="">مثال على الراي-كاستنج</h2><p id="44d32672-96ae-4de2-8754-6a1178e46b21" class="">فيه استخدامات كتير للموضوع دا، من اشهرها و اهمها، بيكون مع الماوس بتاع الكمبيوتر</p><p id="24817c43-0b5e-4a35-b01b-f39626193177" class="">تخيل انه عندك شاشة فيه اوبجكتس كتير كلها ثري-دي و عاوز لما تضغط بالماوس، الجزء المعين اللي ضغط عليه لونه يتغير، او يتحدد، زيه زي اي لعبة بالماوس بتلعبها ع الكمبيوتر، او حتى في الموبايل التاتش، كمثال الصورة دي</p><figure id="a2560b4b-ccc5-43b9-9de2-cb054b839f36" class="image"><a href="../../postsImages/Volume-casting/6WqDxAf-2.png"><img style="width:1404px" src="../../postsImages/Volume-casting/6WqDxAf-2.png"/></a></figure><p id="69343f75-1b02-451d-b0f0-661dedeb4301" class="">لما تكون انت شايف اللعبة (سكرين سبيس) فأنت شايف العالم من زاوية(عالم) الكاميرا، لما بتضغط بالماوس على مكان معين، اللي بيحصل انه بيطلع راي، و الراي دي بتكمل لغاية ما تخبط في اي عنصر، و ممكن في الواقع متخبطش خالص لو انت ضغط في حتة مفيهاش اوبجكت
</p><p id="f3eb09ad-ece4-453c-ad9f-b78d8aa1d216" class="">لاحظ انه التحدي/المشكلة هنا انه لما بتضغط بالماوس فأنت بتضغط في السكرين سبيس ودا بيكون 2D لكن العالم اللي فيه الاوبجكتس بتاعتك بيكون ثري دي، و الهدف بتاع الراي كاستنج انه يعرف اذا مكان الماوس بتاعك في التو-دي بعد ما يتحول لثري-دي هيلمس جزء من الاوبجكتس بتاعتك ولا لا </p><p id="4b79f211-072d-40f7-8ca6-87545f10be12" class="">
لما بنقول اوبجكتس فأحنا نقصد اي جزء ثري-دي في البرنامج/اللعبة زي الاشكال اللي فوق ع اليمين، او الكور اللي في اول ومثال، وهكذا 
</p><figure id="ae8c69d9-85c0-499c-b5be-70792371b176" class="image"><a href="../../postsImages/Volume-casting/Untitled.png"><img style="width:642px" src="../../postsImages/Volume-casting/Untitled.png"/></a></figure><p id="f6dc1b02-2da9-4f1b-8e55-ac652e70d862" class="">هنا مثال اوضح للنتيجة النهائية، وهي بسيطة فعليا ، انك بتقدر تعرف الكورة اللي الماوس ضغط عليها، ودا مجرد مثال من امثلة استخدام الراي-كاستنج، و في الحالة دي بيطلق عليه

3D <strong>Hit Testing/ Mouse Picking/ Picking

و ممكن يكون سؤالك هو: ازاي الراي كاستنج بيحصل رياضيًا، لأنه احنا وصفناه بالكلام لكن في الواقع رياضيا هو بيحصل على اكتر من خطوة، و نظرًا لأنه دي اصلا مقدمة للموضوع اللي عايز اتكلم فيه، مش هتطرق للتفاصيل الخاصة بالراي كاستنج.
</strong></p><h2 id="9488f3c7-d321-4023-a78b-9cc3b7894bba" class="">الهيت تيستنج في محركات الالعاب 
</h2><h3 id="68cf65e8-42c6-42bf-8125-2bdf82b7abe6" class="">Unity Ray casting</h3><p id="80cda31e-b20e-46a1-b5e4-1ebca470f00d" class="">الهيت-تيستنج زي ما وضحنا فوق ببساطة بيستخدم لمعرفة اذا انت لمست جزء معين في اللعبة او البرنامج الثري-دي اللي انت شغال فيه ولا لا، ونظرا لأنه يعتبر شيء اساسي، يعتبر موجود ليه امبلمنتيشن في كل محركات الالعاب </p><p id="6393c6bf-822e-4406-bb58-90e02fa6b808" class="">
</p><p id="61d120fe-abf8-4b38-a17f-9e5e9df1f544" class="">في يونيتي ممكن تعمل كدا</p><pre id="4d2c46fd-1072-4dd8-b914-d47e80f3bd23" class="code"><code>Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit, 100))
            {
                Debug.Log(hit.transform.name);
                Debug.Log(&quot;hit&quot;);
            }</code></pre><p id="3dc5ece3-9bcc-4cbb-bef9-9ce7cd1148d7" class="">فانكشن 
Phisycs.RayCast  هي اللي بتقوم بعمل كل حسابات الكاستنج  في يونيتي </p><h3 id="554494dc-2d41-490f-b26a-db325fcdad35" class="">SceneKit Ray Cast 
</h3><p id="6f9aefa9-c1ba-4e7e-a59d-12ed5d21f27f" class=""> في سين كيت ممكن تعمل راي كاستنج(آبل بتسميه هيت تيستنج) عن طريق الكود الآتي و هيجيبلك اذا كانت الضغطة بتاعتك على اوبجكت معين</p><pre id="4d7baa4a-1cbd-4962-a5e6-788d5f9392a1" class="code"><code>let locationOfTapIn2D = tapRecognizer.location(in: sceneView)
let hitResults = diagramView.sceneView.hitTest(locationOfTapIn2D, options: nil)
let tappedNode = hitResults.first?.node //the object you have tapped</code></pre><p id="793e4d18-5258-488e-951f-8c717494fa61" class="">
</p><p id="29cc85ed-48e9-41f8-9d1b-b1c6dbbab078" class="">كل اللي فات دا جميل، اتكلمنا عن الراي، و عن عملية الراي كاستنج، و ازاي متوفر في محركات الالعاب المختلفة</p><p id="caa8e7be-b95a-4b5e-b44e-b19ea5bc3a3b" class="">
</p><h2 id="c9fb66e8-6c60-416b-8927-e964fd4b227c" class="">حاجات الراي-كاستنج ميقدرش يعملها</h2><p id="da128bfa-88c8-4dcb-b834-4d47cb249983" class="">تخيل انه عندك ابلكيشن بيتطلب انك تجيب اقرب  اوبجكتس لضغطة معينة</p><p id="d738a11c-b0bf-4d30-9e13-fc6b7bcd25a1" class="">بمعنى انه في الصورة دي مطلوب منك تجيب اقرب اوبجكتس للضغطة، لأنه فعليا مكان الضغطة هنا في الفراغ اللي لونه اسود</p><figure id="6684beea-fc2b-4931-ad93-283fe47692c0" class="image"><a href="../../postsImages/Volume-casting/Untitled%201.png"><img style="width:2380px" src="../../postsImages/Volume-casting/Untitled%201.png"/></a></figure><p id="364c9e9a-2193-4410-888c-0ae5d6af2f84" class="">و النتيجة المرادة كالآتي، انه احنا نقدر نحدد اقرب ٤ اوبجكتس للضغطة، او اقرب ٥، المهم نقدر نحدد </p><figure id="e38f85c2-acd8-4db0-a856-d293d493e284" class="image"><a href="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_2.58.12_PM.png"><img style="width:2046px" src="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_2.58.12_PM.png"/></a></figure><p id="8f673379-f476-468a-a8a2-a4168f9d47db" class="">
الموضوع يصبح اكثر تعقيدا و اكثر اهمية لو بشكل عام انت عايز تجيب الاوبجكتس المتجاورة لأي ضغطة لو افترضت انه اليوزر ضغط بصباعه مكان ما ظاهر في الصورة</p><figure id="45a35e81-3dbc-45b4-9685-c597dfe6c24c" class="image"><a href="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_3.22.53_PM.jpg"><img style="width:2232px" src="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_3.22.53_PM.jpg"/></a></figure><p id="6d64b771-2b5a-479e-abd5-16b8a9eead89" class="">لأنه فيه اجزاء متداخلة، ممكن يكون اليوزر قاصده الجزء الصغير اللي لونه جراي، او الجزء البورتقالي الكبير</p><figure id="050db7e2-19ae-490c-b238-287f9761bcdd" class="image"><a href="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_3.22.53_PM_3.jpg"><img style="width:2232px" src="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_3.22.53_PM_3.jpg"/></a></figure><p id="8931ac6d-b6d9-4282-9d7a-3d5c1ea2f14e" class="">او هنا هنا مثلا، لو اليوزر لمس الجزء اللي متوضح في الصورة، فممكن يكون قصده الجزء الاخضر، او الاحمر</p><figure id="adea505d-e666-4c2f-bb6f-953f19bca8ed" class="image"><a href="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_3.22.53_PM_4.jpg"><img style="width:2232px" src="../../postsImages/Volume-casting/Screen_Shot_2022-08-06_at_3.22.53_PM_4.jpg"/></a></figure><p id="9df909a2-0276-4ada-941d-0fd353acbee8" class="">
</p><p id="df6735f1-3987-4b4f-948b-518202b9b22e" class="">لو احنا استخدمنا الهيت-تيستنج مش هنقدر نعرف الاجزاء اللي جنب بعض، لأنه زي ما وضحنا فوق، هو بطلع راي واحدة بس، من مكان اللمسة، و و لما تخبط في جزء معين، يقولك انها خبطت فيه وبناء عليه يقولك انك حاولت تلمس الجزء المعين دا، في حالتنا عاوزين نحاول نعرف الاجزاء اللي الاقرب ل اللمسة، في الصورة دي بنوضح الراي بالاحمر، و انها في هتخبط في جزء واحد بس</p><figure id="30d3fd77-897a-46af-a79c-b1dea8775fbb" class="image"><a href="../../postsImages/Volume-casting/Untitled%202.png"><img style="width:3204px" src="../../postsImages/Volume-casting/Untitled%202.png"/></a></figure><p id="8079e1ef-21a2-416e-b91d-c2d8cfdf70bc" class="">اللي احنا محتاجينه، اننا نعمل حاجة مشابهة توصلنا لزيادة القطر بتاع الراي نفسها، فبدل ما تخبط في اوبجكت واحد، تخبط في الاتنين اللي جنب بعض </p><figure id="cde6ae17-3578-4eac-a173-c15977be62ad" class="image"><a href="../../postsImages/Volume-casting/Untitled%203.png"><img style="width:3572px" src="../../postsImages/Volume-casting/Untitled%203.png"/></a></figure><p id="3bc339e0-35fb-4ee7-8de3-9f88d4793303" class="">لاحظ ازاي الراي متقاطعة مع الجزئين، بدل جزء واحد</p><p id="723687f3-5d94-465b-a8cc-904fca057947" class="">الصورة اللي فوق بتوضح اللي نتمنى اننا نقدر نعمله، لكن فعليا منقدرش نعمل دا بالراي لأنها عبارة عن فيكتور مش حاجة ليها ثيكنس او نصف قطر، لكن دي اول نقطة تجاه الوصول للحل،اننا تخيلناه..</p><h2 id="a83f9f62-fb92-482f-9bc1-1ec308c6a65e" class="">انواع آخرى من الكاستنج</h2><p id="1e852363-0821-44da-8930-f29c933ffedd" class="">في بعض محركات الالعاب، فيه حل للموضوع دا، ببساطة بدل ما بتعمل كاستنج ب راي، ممكن تعمل كاستنج بمكعب، او كاستنج بسليندر
</p><p id="49c0f92c-77a6-4b5d-9c66-e181899c7cc7" class="">ازاي ؟ تعالى نتخيل انه مكان ما الراي هتخبط في جزء معين، هنحط مكعب </p><p id="7e782b84-e98f-4f46-bd92-020c99eeed36" class="">وبعد ما نحط المكعب، نشوف بقى المكعب دا بيتقاطع مع اوبجكتس ولا لا، لو قدرنا نعمل كدا، نظريا المكعب هيتقاطع مع الاوبجكتس القريبة من الراي، حسب حجمه </p><figure id="a8ed82c9-c845-497b-b489-ad5ddaf245fe" class="image"><a href="../../postsImages/Volume-casting/Untitled%204.png"><img style="width:2458px" src="../../postsImages/Volume-casting/Untitled%204.png"/></a></figure><p id="4ac6bab1-6aa4-4474-9c14-722564349d84" class="">الطريقة دي من الكاستنج، اسمها ڤوليوم كاستنج، لأنك فيها بتعمل الكاستنج بالڤوليوم بتاع المكعب، او بتاع اي شكل اخر حسب اختيارك</p><p id="18e18d70-9491-4a00-b4cb-8d429be3cb3e" class="">في محرك زي يونيتي، موجود امبلمنتيشنز جاهزة بتعمل كاستنج للڤوليومز دي
بأستخدام الطريقة دي، هيرجعلنا مثلا انه اليوزر بيحاول يضغط على</p><p id="f5c534d9-9db8-4101-b93f-7b28bf372034" class="">Option 1, or option 2</p><p id="99401d92-fb3f-48d6-807d-cec4addf4f1e" class="">وبناء عليه ممكن نطلع دا في منيو بحيث هو يختار قصده انهي اوبجكت من الاتنين</p><p id="06b27231-7ee5-42a3-a9f5-a2d8ed40639e" class="">
</p><ol type="1" id="eb59be0d-11c1-43d1-b37a-0cf1b435580c" class="numbered-list" start="1"><li><strong>BoxCast 📦</strong></li></ol><ol type="1" id="7d92c29e-2568-4a67-a3b4-1bc6f6e8bc44" class="numbered-list" start="2"><li><strong>Capsule Cast💊</strong></li></ol><ol type="1" id="d0c47fcf-a282-49fd-9072-b367e1360a41" class="numbered-list" start="3"><li><strong>Sphere Cast 🏀</strong></li></ol><ol type="1" id="9e37209a-bd42-4796-8804-b9f22cb547d9" class="numbered-list" start="4"><li><strong>RigidBody Cast 🥎</strong></li></ol><h2 id="b07963b9-add5-418e-ae74-134573dd40bf" class="">Volume Casting In SceneKit
</h2><p id="d3a57004-9b57-4416-82f6-d00540af2e75" class="">علشان نعمل شيء مشابهة للڤوليوم كاستنج في سين كيت، محتاجين نحاول نعمل مجموعة من الخطوات
</p><p id="ea1d19ae-6e33-4aa5-8615-2590acf2ff53" class="">1- Detect Touch Location using Normal HitTesting (already discussed the code)<div class="indented"><p id="cc31bdda-da04-404f-8d41-a3a7387c93c8" class="">In this stage we will convert the touch location from 2D space (Device screen) to a 3D space (World space) which will let us know where our touches belong to in the 3D world.</p></div></p><p id="dfd26721-d0e1-4dc7-8db6-feb619577174" class="">2- place a cube, which has an origin equal to the detected point of hit testing<div class="indented"><p id="110b58ef-b755-482e-b3e5-2dfb78b29336" class="">In this step, we will place an cube on the previously determined 3D Point from step 1</p></div></p><p id="a865dbd7-7c90-479b-b01d-50b75e4ad720" class="">3- calculate/process the intersections with that cube<div class="indented"><p id="fad9c203-99fd-4292-a69a-fe360f7563b6" class="">This will be fun …</p></div></p><h2 id="049837c0-0bb4-4b94-96f8-4d806c72ed23" class="">Technical Implementation of Volume Casting In SceneKit</h2><h3 id="b26e259e-6c2a-4a18-994f-fd0e9be998b4" class="">1. Detect Touch Location</h3><p id="8118c628-fe13-4fce-bc29-3d17f6f76d40" class="">في الخطوة دي هنشتغل كأننا كنا عاوزين نعمل راي كاستنج عادي</p><pre id="29380ae6-f6dc-441d-857d-de3dce179cb3" class="code"><code>//Inside the tap gesture Selector
let locationOfTapIn2D = tapRecognizer.location(in: sceneView)
let hitResults = diagramView.sceneView.hitTest(locationOfTapIn2D, options: nil)
let firstTappedNode = hitResults.first //the object you have tapped</code></pre><h3 id="7dff20c8-d9f1-40f5-897a-20e8a2d224b1" class="">2. Place the cube(Box)</h3><pre id="53f3aaf7-d5c6-4894-a431-45776f1258fc" class="code"><code>let boxHeight = 12 

let boxGeometry = SCNBox.init(width: boxHeight,
 height: boxHeight,
 length: boxHeight, 
 chamferRadius: 2)

let boxNode = SCNNode(geometry: boxGeometry) 
//Note that the node is placed to the root node (World space) 
sceneView?.scene?.rootNode.addChildNode(boxNode)
//Place the box at the touch Coordinates
boxNode.worldPosition = firstHit.worldCoordinates
boxNode.name = &quot;VOLUME_CASTING_BOX&quot;
//This&#x27;s important because you don&#x27;t want the user to see the box you&#x27;ve placed.
boxNode.isHidden = true 
//PhisycsBody is needed so we can check later which objects 
// &#x27;are intersecting with this box 
boxNode.physicsBody = .init(type: .kinematic,
 shape: .init(node: boxNode, options: [:]))</code></pre><p id="8a9d078a-e3a5-46f3-a8d1-e3a353f11c5b" class="">هنا حطينا البوكس اللي بنتكلم عنه، اللي هو هيبقى زي البوكس الاصفر اللي في الصورة اللي فوق، و حددنا له اسم، و حددنا المكان بتاعه ، بالظبط زي الصورة اللي فوق</p><h3 id="7014c7f6-7c1a-491d-b77b-3671a91b74f4" class="">3. Check which objects are intersecting with the placed box:</h3><p id="5a9ee827-74de-4027-b303-c6a806bd067a" class="">اللي احنا عاوزين نعمله هنا، اننا نشوف البادي بتاع البوكس، بيتقاطع مع مين، ممكن تحقق دا عن طريق استخدام
الفانكشن بترجع اراي من <code>SCNPhysicsContact</code></p><p id="5d4875cd-bcc0-404f-9077-0f22c3af99b7" class="">ودا تايب بيحفظ جواه تفاصيل التقاطع الخاصة بالمكعب، و بما انها اراي، فدا معناه انه المكعب قد يتقاطع مع اكتر من اوبجكت، يعني لو معانا الاراي دي، نقدر نعرف اللمسة بتاعتنا قريبة من اي اوبجكت في الورلد</p><figure id="1241c081-2654-4c1f-9acf-e51876ffdcde" class="image"><a href="../../postsImages/Volume-casting/Untitled%205.png"><img style="width:1006px" src="../../postsImages/Volume-casting/Untitled%205.png"/></a></figure><p id="a3cd9d7c-328d-4036-aeec-a5a78b6f1f84" class="">
</p><p id="9fc2fa8f-1c48-4078-b76a-b2b60d03535d" class="">التايب الخاص ب <code>SCNPhysicsContact</code></p><p id="f1901df2-dc46-42f9-9bf7-ae1849655662" class="">مهم جدا و بيحتوي على كل التفاصيل الخاصة بالكونتاكت، الكونتاكت الواحد في حالتنا معناه انه دا اوبجكت يتقاطع مع المكعب اللي احنا حطيناه </p><p id="b12a19c4-83b6-4b97-aa7e-078dbae00099" class="">لو عندنا ٢ كونتاكت، يبقى فيه ٢ اوجكت يتقاطع مع المكعب</p><p id="f8b7a117-4ae6-46ec-947e-835a6e6ca386" class="">دا الهيدر بتاع <code>SCNPhysicsContact</code></p><figure id="c2e76061-71da-4f42-8d0f-5ed05afa0762" class="image"><a href="../../postsImages/Volume-casting/Untitled%206.png"><img style="width:1678px" src="../../postsImages/Volume-casting/Untitled%206.png"/></a></figure><p id="d63de8fa-9310-4450-a808-ecb866dc53b2" class="">لاحظ هنا انه كل كونتاكت بيعطيلك ٢ نود</p><p id="5316cbee-2b6a-48a8-8f98-510fe5a8c724" class="">NodeA, NodeB</p><p id="c7d83179-77e1-4421-89fe-6bdee317aa76" class="">الاولاني هيكون المكعب بتاعك، التاني، اللي هو نود بي، هيكون الجزء اللي بيتقاطع معاه وبناء عليه ممكن تكتب الآتي</p><pre id="9b92c80c-b1eb-4177-8573-6e0d0cdc7d93" class="code"><code>let boxContacts = scene.physicsWorld.contactTest(with: boxNode.physicsBody!, options: [:]

if boxContacts.count &gt; 0 {
//Print Contacts name
 let nodesNames = boxContacts
    .map { $0.nodeB.name ?? &quot;NO_OBJECT_NAME&quot; }
    .filter { $0 != &quot;VOLUME_CASTING_BOX&quot; }

    print(nodesNames)

// Also, you have access to the node itself
// in case you want to highlight it/scale it/do whatever you want
boxContacts.forEach { contactWithBox in
    print(contactWithBox.nodeB)
    }
 }</code></pre><p id="5164c227-8a6f-4caa-8bfd-5d6e58cfffc3" class="">
</p><h3 id="8e558932-2192-4315-bf40-b37d68f1b3f6" class="">ختام الامبلمنتيشن</h3><p id="95322749-5d61-4d35-bed0-3fd930589cf9" class="">الكود الاخير لو محطوط في Main Thread</p><p id="02d4c699-6f9b-468e-b87e-207a1babff97" class="">غالبا الكود هيكراش، ليه ؟ علشان سين كيت شغالة من ثريد خاص بيها و بناء عليه فيه احتمالية مش قليلة ل الريس كونديشنز، و عموما افضل حاجة انها تأكسس سين كيت ديما و ابدا من الثريد بتاعها.. ازاي ؟ </p><p id="14cdf4e7-1503-4b71-8498-d1070fb3be7c" class="">محتاج تكونفيرم ل SCNSceneRendererDelegate</p><p id="9b67d2d5-cfa8-4cbc-ae2d-fd0379798e19" class="">و يكون الكود بتاعك في الفانكشن دي، </p><p id="d8802111-cb52-429d-87ee-12f559a93500" class="">الفانكشن دي بيتعملها كول لكل فريم هيتعمله رندر، نظريا اللعبة او البرنامج بتاعك ممكن يكون كله في الفانكشن دي، ودا الصح لو انت عايز البرنامج بتاعك يكون ثريد سيف، بس في اغلب الاحيان هتجد صعوبة كبيرة في انك تهندل اللوجيك كله فيها</p><p id="f8a13b02-7821-4d39-be8d-40e0259e4de7" class="">لأنه علشان دي فانكشن بيتعملها كول لكل فريم، المفروض ميكونش فيها انستراكشنز كتير تاخد وقت طويل..</p><p id="d350eae1-f962-46c8-b287-4e9cd6556963" class="">
</p><pre id="e7d144d4-e39d-4284-8331-e2cb0fdeff33" class="code"><code>func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
// Place your code here

//this variable will be true when user taps on the screen
// from the selector of tap gesture
// Note: - This also not safe, the app will crach if main thread is setting it while 
// SceneKit tries to read it, but for the sake of simplicity i will left it like this..
// Also, it doesn&#x27;t happen to crach because of this particular propertiy, but yeah..
if isCheckingCloseObjectsToTap, 
let node = scene.nodeNamed(&quot;VOLUME_CASTING_BOX&quot;) as? SCNNode {


defer { 
// after checking convert it to false, because we don&#x27;t want to check in the next frame
// Also, you have access to the node itself
// in case you want to highlight it/scale it/do whatever you want
// if this looks too verbose, then it&#x27;s, this&#x27;s how Rendering loops work :/
isCheckingCloseObjectsToTap = false 
}

let boxContacts = scene.physicsWorld.contactTest(with: boxNode.physicsBody!, options: [:]

if boxContacts.count &gt; 0 {
 let nodesNames = boxContacts
    .map { $0.nodeB.name ?? &quot;&quot; }
    .filter { $0 != &quot;VOLUME_CASTING_BOX&quot; }

    print(nodesNames)


boxContacts.forEach { contactWithBox in
    print(contactWithBox.nodeB)
    }
 }
}</code></pre><p id="8e5bfb1e-090c-40e5-a9f6-cd586443987b" class="">
</p><h3 id="763aef9e-3fdf-4957-82d5-c2d419e0df7b" class="">الختام </h3><p id="12d02971-6fa9-4ce4-8e83-d41d2205dc36" class="">بأستخدام الطريقة دي نقدر نحاكي البيهافيور بتاع الڤوليوم كاستنج اللي في يونيتي، انا بقول نحاكي لأني حتى الان مش متأكد اذا فيه طريقة احسن ولا لا، لكن في كل الاحوال هي الطريقة دي شغالة كويس، و منها تقدر تسأل اليوزر عن الاوبجكت اللي عايز يختاره بالظبط اللي قريب من مكان لمسته </p><p id="1e52f0ce-b791-408e-9009-51f9c5339e9c" class="">
</p><p id="7bb158fd-b826-4b67-a5d5-289e756b2cd0" class="">سين-كيت عبارة عن محرك جميل و قوي في عالم آبل لكن مش فيه كل الفانكشنز و الدعم اللي موجود في يونيتي، و كمان ينقصه الدوكيمنتيشن بشكل كبير جدا جدا، مفيش حتى الان حسب ما اعرف حد عمل امبلمنتيشن مشابه للفوليوم كاستنج في سين كيت و بناء عليه ممكت ابقى اكتب نفس البلوج لكن بالانجليزي بما انه دا محتوى مش موجود ابدا ع النت.</p><p id="f4e29727-3ac8-4896-90b3-d9db885477b7" class="">
</p></div></article></body></html>
 