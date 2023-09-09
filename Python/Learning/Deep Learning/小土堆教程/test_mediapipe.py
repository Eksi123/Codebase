# import cv2
# import mediapipe as mp
# from tqdm import tqdm
# import time
# import numpy as np
#
# mp_drawing = mp.solutions.drawing_utils
# mp_drawing_styles = mp.solutions.drawing_styles
# mp_holistic = mp.solutions.holistic
#
# cap = cv2.VideoCapture(0)
# with mp_holistic.Holistic(
#         min_detection_confidence=0.5,
#         min_tracking_confidence=0.5) as holistic:
#     while cap.isOpened():
#         success, image = cap.read()
#         if not success:
#             print("false")
#             # If loading a video, use 'break' instead of 'continue'.
#             continue
#
#         image.flags.writeable = False
#         image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
#         results = holistic.process(image)
#
#         h, w, c = image.shape
#         start_time = time.time()
#
#         # 画图
#         image.flags.writeable = True
#         image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
#
#         mp_drawing.draw_landmarks(
#             image,
#             results.pose_landmarks,
#             mp_holistic.POSE_CONNECTIONS,
#             landmark_drawing_spec=mp_drawing_styles
#                 .get_default_pose_landmarks_style())
#
#         if results.pose_landmarks:
#               for index, landmarks in enumerate(results.pose_landmarks.landmark):
#                       cx = int(results.pose_landmarks.landmark[index].x*w)
#                       cy = int(results.pose_landmarks.landmark[index].y*h)
#                       cz = results.pose_landmarks.landmark[index].z
#                       v = results.pose_landmarks.landmark[index].visibility
#
#                       filename = 'mediapipe_results.txt'
#                       test = open(filename, 'a')
#
#                       if (index <= 0):
#                           print('\n', file=test)
#                           print(time.strftime("%Y-%m-%d-%H_%M_%S", time.localtime()), end=',', file=test)
#                       print(cx, ',', cy, ',', cz, ',', v, end=',', file=test)
#
#
#         cv2.imshow('MediaPipe Holistic', cv2.flip(image, 1))
#         if cv2.waitKey(5) & 0xFF == 27:
#             break
# cap.release()
#


# import cv2
# import mediapipe as mp
#
# mp_drawing = mp.solutions.drawing_utils
# mp_drawing_styles = mp.solutions.drawing_styles
# mp_holistic = mp.solutions.holistic
#
# cap = cv2.VideoCapture(0)
# with mp_holistic.Holistic(
#         min_detection_confidence=0.5,
#         min_tracking_confidence=0.5) as holistic:
#     while cap.isOpened():
#         success, image = cap.read()
#         if not success:
#             print("Ignoring empty camera frame.")
#             # If loading a video, use 'break' instead of 'continue'.
#             continue
#
#         image.flags.writeable = False
#         image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
#         results = holistic.process(image)
#         # 画图
#         image.flags.writeable = True
#         image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
#         mp_drawing.draw_landmarks(
#             image,
#             results.face_landmarks,
#             mp_holistic.FACEMESH_CONTOURS,
#             landmark_drawing_spec=None,
#             connection_drawing_spec=mp_drawing_styles
#                 .get_default_face_mesh_contours_style())
#         mp_drawing.draw_landmarks(
#             image,
#             results.pose_landmarks,
#             mp_holistic.POSE_CONNECTIONS,
#             landmark_drawing_spec=mp_drawing_styles
#                 .get_default_pose_landmarks_style())
#
#         mp_drawing.draw_landmarks(image, results.left_hand_landmarks, mp_holistic.HAND_CONNECTIONS)
#         mp_drawing.draw_landmarks(image, results.right_hand_landmarks, mp_holistic.HAND_CONNECTIONS)
#
#         # 右手21个节点坐标
#         if results.right_hand_landmarks:
#             for index, landmarks in enumerate(results.right_hand_landmarks.landmark):
#                 print(index, landmarks)
#         # 鼻子坐标
#         # print(results.pose_landmarks.landmark[mp_holistic.PoseLandmark.NOSE])
#         cv2.imshow('MediaPipe Holistic', cv2.flip(image, 1))
#         if cv2.waitKey(5) & 0xFF == 27:
#             break
# cap.release()


# import cv2
# import mediapipe as mp
# import time
#
# cap = cv2.VideoCapture(0)
# mpHands = mp.solutions.hands
# hands = mpHands.Hands(min_detection_confidence=0.5)
# mpDraw = mp.solutions.drawing_utils
# handLmsStyle = mpDraw.DrawingSpec(color=(0, 0, 255), thickness=5)
# handConsStyle = mpDraw.DrawingSpec(color=(0, 255, 0), thickness=10)
# pTime = 0
# cTime = 0
# # https://www.youtube.com/watch?v=x4eeX7WJIuA
# while True:
#     ret, img = cap.read()
#     if ret:
#         imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
#         result = hands.process(imgRGB)
#         # print(result.multi_hand_landmarks)
#         imgHeight = img.shape[0]
#         imgWidth = img.shape[1]
#
#         if result.multi_hand_landmarks:
#             for handLms in result.multi_hand_landmarks:
#                 mpDraw.draw_landmarks(img, handLms, mpHands.HAND_CONNECTIONS, handLmsStyle, handConsStyle)
#                 for i, lm in enumerate(handLms.landmark):
#                     xPos = int(lm.x * imgWidth)
#                     yPos = int(lm.y * imgHeight)
#                     zPos = int(lm.z)
#                     cv2.putText(img, str(i), (xPos - 25, yPos + 5), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (0, 0, 255), 2)
#                     if i == 4:
#                         cv2.circle(img, (xPos, yPos), 20, (0, 0, 255), cv2.FILLED)
#                     print(i, xPos, yPos, zPos)
#         cTime = time.time()
#         fps = 1 / (cTime - pTime)
#         pTime = cTime
#         cv2.putText(img, f"FPS : {int(fps)}", (30, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 3)
#         cv2.imshow('img', img)
#
#     if cv2.waitKey(1) == ord('q'):
#         break


import cv2
import mediapipe as mp

mp_drawing = mp.solutions.drawing_utils
mp_hands = mp.solutions.hands
file_list = []
# For static images:
hands = mp_hands.Hands(
    static_image_mode=True,
    max_num_hands=2,
    min_detection_confidence=0.5)
for idx, file in enumerate(file_list):
    # Read an image, flip it around y-axis for correct handedness output (see
    # above).
    image = cv2.flip(cv2.imread(file), 1)
    # Convert the BGR image to RGB before processing.
    results = hands.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))

    # Print handedness and draw hand landmarks on the image.
    print('Handedness:', results.multi_handedness)
    if not results.multi_hand_landmarks:
        continue
    image_hight, image_width, _ = image.shape
    annotated_image = image.copy()
    for hand_landmarks in results.multi_hand_landmarks:
        print('hand_landmarks:', hand_landmarks)
        print(
            f'Index finger tip coordinates: (',
            f'{hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_TIP].x * image_width}, '
            f'{hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_TIP].y * image_hight})'
        )
        mp_drawing.draw_landmarks(
            annotated_image, hand_landmarks, mp_hands.HAND_CONNECTIONS)
    cv2.imwrite(
        '/tmp/annotated_image' + str(idx) + '.png', cv2.flip(annotated_image, 1))
hands.close()

# For webcam input:
hands = mp_hands.Hands(
    min_detection_confidence=0.5, min_tracking_confidence=0.5)
cap = cv2.VideoCapture(0)
while cap.isOpened():
    success, image = cap.read()
    if not success:
        print("Ignoring empty camera frame.")
        # If loading a video, use 'break' instead of 'continue'.
        continue

    # Flip the image horizontally for a later selfie-view display, and convert
    # the BGR image to RGB.
    image = cv2.cvtColor(cv2.flip(image, 1), cv2.COLOR_BGR2RGB)
    # To improve performance, optionally mark the image as not writeable to
    # pass by reference.
    image.flags.writeable = False
    results = hands.process(image)

    # Draw the hand annotations on the image.
    image.flags.writeable = True
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    if results.multi_hand_landmarks:
        for hand_landmarks in results.multi_hand_landmarks:

            mp_drawing.draw_landmarks(
                image, hand_landmarks, mp_hands.HAND_CONNECTIONS)
    cv2.imshow('Hands', image)
    if cv2.waitKey(5) & 0xFF == 27:
        break
hands.close()
cap.release()


# import cv2
# import mediapipe as mp
# mp_face_detection = mp.solutions.face_detection
# mp_drawing = mp.solutions.drawing_utils
# # 视频作为输入
# cap = cv2.VideoCapture(0)
# with mp_face_detection.FaceDetection(min_detection_confidence=0.5) as face_detection:
#   while cap.isOpened():
#     success, image = cap.read()
#     if not success:
#       print("Ignoring empty camera frame.")
#       # 如果正在加载摄像头，使用continue而不是break。
#       break
#
#     # 水平翻转图像为以后的自拍视图显示，并将BGR图像转换为RGB。
#     image = cv2.cvtColor(cv2.flip(image, 1), cv2.COLOR_BGR2RGB)
#     # 为了提高性能，可选择将图像标记为不可写以通过引用传递。
#     image.flags.writeable = False
#     results = face_detection.process(image)
#
#     # 在图像上绘制人脸检测注释。
#     image.flags.writeable = True
#     image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
#     if results.detections:
#       for detection in results.detections:
#         mp_drawing.draw_detection(image, detection)
#     cv2.imshow('MediaPipe Face Detection', image)
#     if cv2.waitKey(5) & 0xFF == 27:
#       break
# cap.release()
